library(ks)


### Name: kcopula
### Title: Kernel copula (density) estimate
### Aliases: kcopula kcopula.de
### Keywords: smooth

### ** Examples

library(MASS)
data(fgl)
x <- fgl[,c("RI", "Na")]
Chat <- kcopula(x=x)
plot(Chat, disp="persp", thin=3, col="white", border=1)



