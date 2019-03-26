library(rbtc)


### Name: containsPoint
### Title: containsPoint-methods
### Aliases: containsPoint containsPoint,ECPARAM,bigz,bigz-method
###   containsPoint,ECPARAM,integer,integer-method
###   containsPoint,ECPARAM,character,character-method

### ** Examples

p <- "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F"
b <- "0x0000000000000000000000000000000000000000000000000000000000000007"
a <- "0x0000000000000000000000000000000000000000000000000000000000000000"
curve256 <- ecparam(p, a, b)
Gx <- "0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798"
Gy <- "0x483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08ffb10d4b8"
containsPoint(curve256, Gx, Gy)



