library(StatDA)


### Name: plotmvoutlier
### Title: Multivariate outlier plot
### Aliases: plotmvoutlier
### Keywords: multivariate dplot

### ** Examples

data(moss)
X=moss[,"XCOO"]
Y=moss[,"YCOO"]
el=c("Ag","As","Bi","Cd","Co","Cu","Ni")
x=log10(moss[,el])

data(kola.background)
plotmvoutlier(cbind(X,Y),x,symb=FALSE,map.col=c("grey","grey","grey","grey"),
       map.lwd=c(1,1,1,1),
       xlab="",ylab="",frame.plot=FALSE,xaxt="n",yaxt="n")



