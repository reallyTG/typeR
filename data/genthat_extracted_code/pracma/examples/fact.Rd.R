library(pracma)


### Name: fact
### Title: Factorial Function
### Aliases: fact factorial2
### Keywords: math

### ** Examples

fact(c(-1, 0, 1, NA, 171))  #=> NaN   1   1  NA Inf
fact(100)                   #=> 9.332621544394410e+157
factorial(100)              #=> 9.332621544394225e+157
# correct value:                9.332621544394415e+157
# Stirling's approximation:     9.324847625269420e+157
# n! ~ sqrt(2*pi*n) * (n/e)^n

factorial2(8);  factorial2(9);  factorial2(10)  # 384   945  3840
factorial(10) / factorial2(10)                  # => factorial2(9)



