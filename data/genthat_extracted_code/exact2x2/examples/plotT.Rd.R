library(exact2x2)


### Name: plotT
### Title: Plot or Print ordering function for unconditional exact test
### Aliases: plotT plotT.function plotT.numeric orderMat orderMat.function
###   orderMat.numeric
### Keywords: hplot

### ** Examples


parorig<- par(no.readonly=TRUE)
par(mfrow=c(2,2),mar=c(1,3,3,1))
TT1<-pickTstat(method="score", parmtype="ratio", tsmethod="central", alternative="two.sided")
round(orderMat(TT1,8,8,1,graphStyle=TRUE),2)
TT2<-pickTstat(method="simple", parmtype="ratio", tsmethod="central", alternative="two.sided")
TT3<-pickTstat(method="simple", parmtype="difference", tsmethod="central", alternative="two.sided")
plotT(TT2, 8,8, 1, main="Ratio, Simple")
plotT(TT3, 8,8, 0, main="Difference, Simple")
plotT(TT1, 8,8, 1, main="Ratio, Score (delta0=1)")
TF<-pickTstat(method="FisherAdj", parmtype="ratio", tsmethod="central", alternative="two.sided")
plotT(TF,8,8,1, main="FisherAdj")
par(parorig)



