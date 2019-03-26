library(osDesign)


### Name: ccPower
### Title: Simulation-based estimation of power for the case-control design
### Aliases: ccPower

### ** Examples

##
data(Ohio)

## 
XM   <- cbind(Int=1, Ohio[,1:3])
fitM <- glm(cbind(Death, N-Death) ~ factor(Age) + Sex + Race, data=Ohio,
            family=binomial)
betaNamesM <- c("Int", "Age1", "Age2", "Sex", "Race")

## Power for a single CC design
##
## Not run: 
##D ccResult1 <- ccPower(B=1000, betaTruth=fitM$coef, X=XM, N=Ohio$N, r=1,
##D                      nCC=500, betaNames=betaNamesM)
##D ccResult1
## End(Not run)

## Power for the CC design, based on a balanced design with 
## various sample sizes
##
## Not run: 
##D ccResult2 <- ccPower(B=1000, betaTruth=fitM$coef, X=XM, N=Ohio$N, r=1,
##D                      nCC=seq(from=100, to=500, by=50), betaNames=betaNamesM)
##D ccResult2
## End(Not run)

## Recalculate power for the setting where the age coefficients are
## halved from their observed true values
##   * the intercept is modified, accordingly, using the beta0() function
##
newBetaM      <- fitM$coef
newBetaM[2:3] <- newBetaM[2:3] / 2
newBetaM[1]   <- beta0(betaX=newBetaM[-1], X=XM, N=Ohio$N,
rhoY=sum(Ohio$Death)/sum(Ohio$N))
##
## Not run: 
##D ccResult3 <- ccPower(B=1000, betaTruth=newBetaM, X=XM, N=Ohio$N,
##D                      r=1, nCC=seq(from=100, to=500, by=50),
##D                      betaNames=betaNamesM)
##D ccResult3
## End(Not run)



