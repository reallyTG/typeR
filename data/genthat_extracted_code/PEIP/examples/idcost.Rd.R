library(PEIP)


### Name: idcost
### Title: Inverse cosine transform
### Aliases: idcost
### Keywords: misc

### ** Examples


x <- 1:4

### compare fft with cosine transform
     fft(x)
    
zig = dcost(x)
zag = idcost(zig)




