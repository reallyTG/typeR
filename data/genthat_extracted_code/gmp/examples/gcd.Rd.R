library(gmp)


### Name: gcd.bigz
### Title: Greatest Common Divisor (GCD) and Least Common Multiple (LCM)
### Aliases: gcd.bigz gcd gcd.default lcm.default lcm.bigz
### Keywords: arith

### ** Examples

gcd.bigz(210,342) # or also
lcm.bigz(210,342)
a <- 210 ; b <- 342
stopifnot(gcd.bigz(a,b) * lcm.bigz(a,b) == a * b)

## or
(a <- as.bigz("82696155787249022588"))
(b <- as.bigz("65175989479756205392"))
gcd(a,b) # 4
stopifnot(gcd(a,b) * lcm.bigz(a,b) == a * b)



