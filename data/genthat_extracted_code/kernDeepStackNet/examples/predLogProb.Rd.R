library(kernDeepStackNet)


### Name: predLogProb
### Title: Predictive logarithmic probability of Kriging model
### Aliases: predLogProb
### Keywords: models & regression

### ** Examples

library(DiceKriging)
# Generate design of experiments
design.fact <- expand.grid(x1=seq(0,1,length=4), x2=seq(0,1,length=4))
y <- apply(design.fact, 1, branin) 

# Estimate Kriging model
km_fit <- km(design=design.fact, response=y, control=list(trace=FALSE), 
nugget.estim=TRUE, iso=FALSE)

# Calculate leave one out parameters and performance measure
loo <- leaveOneOut.km(model=km_fit, type="UK", trend.reestim=TRUE)
predLogProbs <- predLogProb(predMean=loo$mean, predSigma=loo$sd^2, y=y, X=X)



