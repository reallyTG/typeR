library(numbers)


### Name: modinv
### Title: Modular Inverse
### Aliases: modinv

### ** Examples

modinv(5, 1001)  #=> 801, as 5*801 = 4005 = 1 mod 1001

Modinv <- Vectorize(modinv, "n")
((1:10)*Modinv(1:10, 11)) %% 11     #=> 1 1 1 1 1 1 1 1 1 1



