library(LifeHist)


### Name: MatFit
### Title: Wrapper Function to Estimate a 2- or 3-Parameters Logistic
###   Regression of Sexual Maturity
### Aliases: MatFit
### Keywords: optimize models

### ** Examples

data(BlackAngler.lenmatdat)
BA.matlen     <- MatCount(matdat=BlackAngler.lenmatdat,
                          fem.key=2,
                          mal.key=1,
                          stage.key=2,
                          season.key=c(5,7))
plot(BA.matlen[[2]],
     pred.50=35,
     pred.95=55,
     pred.unit="Length (cm)",
     top.text="Males Rep Season",
     lwd=2, xlab="", ylab="")
par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(4,4,1,1))
plot(BA.matlen[[1]],pred.50=35,pred.95=55,pred.unit="Length (cm)",
     top.text="Males NoRep Season", lwd=2, xlab="", ylab="")
plot(BA.matlen[[2]],pred.50=35,pred.95=55,pred.unit="Length (cm)",
     top.text="Males Rep Season", lwd=2, xlab="", ylab="")
plot(BA.matlen[[3]],pred.50=85,pred.95=110,pred.unit="Length (cm)",
     top.text="Females NoRep Season", lwd=2, xlab="", ylab="")
plot(BA.matlen[[4]],pred.50=55,pred.95=75,pred.unit="Length (cm)",
     top.text="Females Rep Season", lwd=2, xlab="", ylab="")
require(optimx)
BA.matlen.mal <- MatFit(p=2,
                        par=c(35,55),
                        matdat=BA.matlen[[2]],
                        method=c("spg", "CG", "Nelder-Mead"),
                        itnmax=100)
#
plot(BA.matlen[[2]],
     pred.50=BA.matlen.mal[[1]]$par.mle[1],
     pred.95=BA.matlen.mal[[1]]$par.mle[2],
     pred.unit="Length (cm)",
     top.text="Males Reproductive Season",
     lwd=2,
     xlab="Length (cm)",
     ylab="Proportion Mature")



