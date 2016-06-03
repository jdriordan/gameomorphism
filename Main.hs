import Data.Word
import Data.Bits

main = print "lol"

data Clock = Clock {m::Word8, t::Word8}
data Z80 = Z80 {clock::Clock, r::Registers}
data Registers = Registers {
    a::Word8, b::Word8, c::Word8, d::Word8,
    e::Word8, h::Word8, l::Word8, f::Word8,

    pc::Word16, sp::Word16,

    lastClock::Clock}

initial = Registers {
    a=0, b=0, c=0, d=0,
    e=0, h=0, l=0, f=0,

    pc=0, sp=0,

    lastClock= Clock {m=0,t=0}}

type Instruction = Z80->Z80

addRE old = old {
    a = a old + e old,
    f = 0
}
