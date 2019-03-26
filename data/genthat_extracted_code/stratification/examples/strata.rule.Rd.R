library(stratification)


### Name: strata.rule
### Title: Non-Iterative Methods of Strata Construction
### Aliases: strata.cumrootf strata.geo
### Keywords: survey

### ** Examples

### Example for strata.cumrootf
res <- matrix(NA, nrow=20, ncol=2)
i <- 1
for ( n in seq(100,2000,100)){
    cum <- strata.cumrootf(x=MRTS, CV=0.01, Ls=4, alloc=c(0.5,0,0.5), nclass=n)
    res[i,] <- c(n,cum$n)
    i <- i + 1
}
plot(res, ylab="suggested sample size n", xlab="number of classes", main=expression(
     paste("Example of the effect of nclass on n for the cum",sqrt(f)," method")))

### Example for strata.geo
strata.geo(x=Sweden$REV84, CV=0.05, Ls=5, alloc=c(0.35,0.35,0), model="none")
strata.geo(x=Sweden$REV84, CV=0.05, Ls=5, alloc=c(0.35,0.35,0), model="loglinear",
       model.control=list(beta=1.058355, sig2=0.06593083, ph=1))
strata.geo(x=Sweden$REV84, CV=0.05, Ls=5, alloc=c(0.35,0.35,0), rh=0.85,
       model="loglinear", model.control=list(beta=1.058355, sig2=0.06593083, ph=1))
# When non-response or a model is added, the stratum boundaries do not change, 
# only the nh's do.

### Exemple of how a certainty stratum can be usefull with these methods
strata.cumrootf(x=Sweden$REV84, CV=0.05, Ls=4, alloc=c(0.35,0.35,0), model="none",
                nclass=50)
strata.cumrootf(x=sort(Sweden$REV84), CV=0.05, Ls=4, alloc=c(0.35,0.35,0), 
                certain=282:284, model="none", nclass=50)
# The certainty stratum is used here to ensure that the three large units in the
# Sweden$REV84 population are in the sample, since no take-all stratum can be forced 
# in the stratified design with the cumulative root frequency or geometric method.
# We see that this allows to reduce by more than half the suggested sample size n
# (47 vs 19). This example was presented in Baillargeon and Rivest (2011). 




