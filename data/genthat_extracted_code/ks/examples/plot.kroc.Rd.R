library(ks)


### Name: plot.kroc
### Title: Plot for kernel receiver operating characteristic curve (ROC)
###   estimate
### Aliases: plot.kroc
### Keywords: hplot

### ** Examples

library(MASS)
data(fgl)
x1 <- fgl[fgl[,"type"]=="WinF",c("RI", "Na")]
x2 <- fgl[fgl[,"type"]=="Head",c("RI", "Na")]
Rhat <- kroc(x1=x1, x2=x2) 
plot(Rhat, add.roc.ref=TRUE)



