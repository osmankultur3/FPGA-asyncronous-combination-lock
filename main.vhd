library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- My password is 11100001  in this case.
entity deneme is
    Port ( Clock : in  STD_LOGIC;
		Reset : in  STD_LOGIC;
		x1 : in  STD_LOGIC; -- MSB
		x0 : in  STD_LOGIC; -- LSB
		led1 : out  STD_LOGIC;
		led2 : out  STD_LOGIC;
		led3 : out  STD_LOGIC;
		led4 : out  STD_LOGIC;
		led5 : out  STD_LOGIC;
		led6 : out  STD_LOGIC;
		led7 : out  STD_LOGIC;
		led8 : out  STD_LOGIC);			
end deneme;
architecture Behavioral of deneme is
-- Intermediate Signals
type state_type is (A,B,C,D);
signal state : state_type;

Begin
-- If user enters wrong digits, the machine goes back to initial state. (goes state A)
process(Clock,Reset)
begin
if Reset='1' then state <=A;
elsif Clock'event and Clock='1' then
case state is

when A => if x1='1' and x0='1' then
state <= B;
else
state <= A;
end if;

when B => if x1='1' and x0='0' then
state <= C;
else
state <= A;
end if;

when C => if x1='0' and x0='0' then
state <= D;
else
state <= A;
end if;

when D => if x1='0' and x0='1' then
state <= A;
end if;
end case;
end if;
end process;

process(state,x1,x0)
begin
case state is
-- If first two digits are entered correctly, then first led will be on. Otherwise all leds are off.
when A => if x1='1' and x0='1' then
led1 <= '1';
led2 <= '0';
led3 <= '0';
led4 <= '0';
led5 <= '0';
led6 <= '0';
led7 <= '0';
led8 <= '0';
else
led1 <= '0';
led2 <= '0';
led3 <= '0';
led4 <= '0';
led5 <= '0';
led6 <= '0';
led7 <= '0';
led8 <= '0';
end if;
-- If second two digits are entered correctly, then first and second led will be on. Otherwise all leds are off.
when B => if x1='1' and x0='0' then

led1 <= '1';
led2 <= '1';
led3 <= '0';
led4 <= '0';
led5 <= '0';
led6 <= '0';
led7 <= '0';
led8 <= '0';
else
led1 <= '0';
led2 <= '0';
led3 <= '0';
led4 <= '0';
led5 <= '0';
led6 <= '0';
led7 <= '0';
led8 <= '0';
end if;
-- If third two digits are entered correctly, then first, second and third leds will be on. Otherwise all leds are off.

when C => if x1='0' and x0='0' then

led1 <= '1';
led2 <= '1';
led3 <= '1';
led4 <= '0';
led5 <= '0';
led6 <= '0';
led7 <= '0';
led8 <= '0';
else
led1 <= '0';
led2 <= '0';
led3 <= '0';
led4 <= '0';
led5 <= '0';
led6 <= '0';
led7 <= '0';
led8 <= '0';
end if;
-- If last two digits are entered correctly, then all eight leds will be on. Otherwise all leds are off.
when D => if x1='0' and x0='1' then

led1 <= '1';
led2 <= '1';
led3 <= '1';
led4 <= '1';
led5 <= '1';
led6 <= '1';
led7 <= '1';
led8 <= '1';
else
led1 <= '0';
led2 <= '0';
led3 <= '0';
led4 <= '0';
led5 <= '0';
led6 <= '0';
led7 <= '0';
led8 <= '0';
end if;
end case;
end process;
end Behavioral;
