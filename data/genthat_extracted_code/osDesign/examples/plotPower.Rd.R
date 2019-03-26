library(osDesign)


### Name: plotPower
### Title: Plot function for power, based on two-phase and case-control
###   design
### Aliases: plotPower

### ** Examples

##
data(Ohio)

##
XM   <- cbind(Int=1, Ohio[,1:3])
fitM <- glm(cbind(Death, N-Death) ~ factor(Age) + Sex + Race, data=Ohio,
            family=binomial)
betaNamesM <- c("Int", "Age1", "Age2", "Sex", "Race")

## Power for the TPS design where phase I stratification is based on Age
##
newBetaM      <- fitM$coef
newBetaM[2:3] <- newBetaM[2:3] / 2
##
## Not run: 
##D powerRaceTPS <- tpsPower(B=10000, betaTruth=fitM$coef, X=XM, N=Ohio$N,
##D                     strata=4,
##D                     nII=seq(from=100, to=1000, by=100),
##D 		 betaNames=c("Int", "Age1", "Age2", "Sex", "Race"), monitor=1000)
##D ##
##D par(mfrow=c(2,2))
##D plotPower(powerRaceTPS, include="TPS", coefNum=2,
##D           xAxis=seq(from=100, to=1000, by=100),
##D           main=expression("Age effect (65-74 vs. 55-64 years), " * beta[A1]),
##D           legendXY=c(800, 65))
##D plotPower(powerRaceTPS, include="ML", coefNum=2,
##D           xAxis=seq(from=100, to=1000, by=100),
##D           main=expression("Age effect (65-74 vs. 55-64 years), " * beta[A1]),
##D           legendXY=c(800, 65))
##D plotPower(powerRaceTPS, include="WL", coefNum=2,
##D           xAxis=seq(from=100, to=1000, by=100),
##D           main=expression("Age effect (65-74 vs. 55-64 years), " * beta[A1]),
##D           legendXY=c(800, 65))
##D plotPower(powerRaceTPS, include="CC", coefNum=2,
##D           xAxis=seq(from=100, to=1000, by=100),
##D           main=expression("Age effect (65-74 vs. 55-64 years), " * beta[A1]),
##D           legendXY=c(800, 65))
## End(Not run)

## Power 
##
## Not run: 
##D ccResult <- ccPower(B=1000, betaTruth=newBetaM, X=XM, N=Ohio$N, r=0.5,
##D                     nCC=seq(from=100, to=500, by=50), betaNames=betaNamesM,
##D                     monitor=100)
##D ##
##D par(mfrow=c(2,2))
##D plotPower(ccResult, coefNum=2, yAxis=seq(from=0, to=100, by=20),
##D             xAxis=seq(from=100, to=500, by=100),
##D             main=expression("Age effect (65-74 vs. 55-64 years), " * beta[A1]))
##D plotPower(ccResult, coefNum=3, yAxis=seq(from=0, to=100, by=20),
##D             xAxis=seq(from=100, to=500, by=100),
##D             main=expression("Age effect (75-84 vs. 55-64 years), " * beta[A2]))
##D plotPower(ccResult, coefNum=4, yAxis=seq(from=0, to=100, by=20),
##D             xAxis=seq(from=100, to=500, by=100),
##D             main=expression("Sex effect, " * beta[S]))
##D plotPower(ccResult, coefNum=5, yAxis=seq(from=0, to=100, by=20),
##D             xAxis=seq(from=100, to=500, by=100),
##D             main=expression("Race effect, " * beta[R]))
## End(Not run)



