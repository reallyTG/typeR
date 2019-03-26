library(osDesign)


### Name: tpsPower
### Title: Simulation-based estimation of power for the two-phase study
###   design
### Aliases: tpsPower

### ** Examples

##
data(Ohio)

## 
XM   <- cbind(Int=1, Ohio[,1:3])
fitM <- glm(cbind(Death, N-Death) ~ factor(Age) + Sex + Race, data=Ohio,
            family=binomial)
betaNamesM <- c("Int", "Age1", "Age2", "Sex", "Race")

## Power for the TPS design where phase I stratification is based on Race.
##
## Not run: 
##D tpsResult1 <- tpsPower(B=1000, beta=fitM$coef, X=XM, N=Ohio$N, strata=4,
##D                        nII=seq(from=100, to=1000, by=100),
##D                        betaNames=betaNamesM, monitor=100)
##D tpsResult1
## End(Not run)

## Power for the TPS design where phase I stratification is based on Age
##   * consider the setting where the age coefficients are halved from
##     their observed true values
##   * the intercept is modified, accordingly, using the beta0() function
##
newBetaM      <- fitM$coef
newBetaM[2:3] <- newBetaM[2:3] / 2
newBetaM[1]   <- beta0(betaX=newBetaM[-1], X=XM, N=Ohio$N,
                       rhoY=sum(Ohio$Death)/sum(Ohio$N))
##
## Not run: 
##D tpsResult2 <- tpsPower(B=1000, beta=fitM$coef, X=XM, N=Ohio$N, strata=2,
##D                        nII=seq(from=100, to=500, by=50),
##D                        betaNames=betaNamesM, monitor=100)
##D tpsResult2
## End(Not run)



