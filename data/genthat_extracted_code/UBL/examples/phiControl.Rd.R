library(UBL)


### Name: phi.control
### Title: Estimation of parameters used for obtaining the relevance
###   function.
### Aliases: phi.control
### Keywords: relevance function

### ** Examples


data(morley)
# the target variable
y <- morley$Speed

# the target variable has "low" and "high"extremes 
boxplot(y)

## using method "extremes" considering that 
## "both" extremes are important
phiF.argsB <- phi.control(y,method="extremes",extr.type="both")
y.phiB <- phi(y, control.parms=phiF.argsB)
plot(y, y.phiB)

## using method "extremes" considering that only the
## "high" extremes are relevant
phiF.argsH <- phi.control(y,method="extremes",extr.type="high")
y.phiH <- phi(y, control.parms=phiF.argsH)
plot(y, y.phiH)


## using method "range" to choose the important values:
rel <- matrix(0,ncol=3,nrow=0)
rel <- rbind(rel,c(700,0,0)) 
rel <- rbind(rel,c(800,1,0))
rel <- rbind(rel,c(900,0,0))
rel <- rbind(rel,c(1000,1,0))
rel
phiF.argsR <- phi.control(y,method="range",control.pts=rel)
y.phiR <- phi(y, control.parms=phiF.argsR)

plot(y, y.phiR)



