library(riverdist)


### Name: checkbraidedTF
### Title: Check for Braiding in a River Network
### Aliases: checkbraidedTF

### ** Examples

data(Gulk,KilleyW)
Gulk <- setmouth(seg=1, vert=1, rivers=Gulk)
plot(x=Gulk)
checkbraidedTF(rivers=Gulk, toreturn="logical")

KilleyW <- setmouth(seg=1, vert=288, rivers=KilleyW)
plot(x=KilleyW)
checkbraidedTF(rivers=KilleyW, toreturn="logical")
checkbraidedTF(rivers=KilleyW, toreturn="routes")

KilleyW.1 <- checkbraidedTF(rivers=KilleyW, toreturn="rivers")
str(KilleyW.1)



