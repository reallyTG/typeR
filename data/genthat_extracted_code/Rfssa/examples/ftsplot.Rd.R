library(Rfssa)


### Name: ftsplot
### Title: Functional Time Series Plots
### Aliases: ftsplot

### ** Examples

data("Callcenter")
library(fda)
D <- matrix(sqrt(Callcenter$calls),nrow = 240)
N <- ncol(D)
time <- 1:30
K <- nrow(D)
u <- seq(0,K,length.out =K)
d <- 22 #Optimal Number of basises
basis <- create.bspline.basis(c(min(u),max(u)),d)
Ysmooth <- smooth.basis(u,D,basis)
Y <- Ysmooth$fd

par(mar=c(2,1,2,2),mfrow=c(1,3))
ftsplot(u,time,Y[1:30],space = 0.4,type=1,ylab = "",xlab = "Day",main = "Typ1=1")
ftsplot(u,time,Y[1:30],space = 0.4,type=2,ylab = "",xlab = "Day",main = "Typ1=2")
ftsplot(u,time,Y[1:30],space = 0.4,type=3,ylab = "",xlab = "Day",main = "Typ1=3")



