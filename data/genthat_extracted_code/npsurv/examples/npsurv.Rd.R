library(npsurv)


### Name: npsurv
### Title: Nonparametric Survival Function Estimation
### Aliases: npsurv npsurv.object
### Keywords: function

### ** Examples

## all exact observations
data(acfail)
plot(npsurv(acfail))

## right-censored (and exact) observations
data(gastric)
plot(npsurv(gastric))

data(leukemia)
i = leukemia[,"group"] == "Placebo"
plot(npsurv(leukemia[i,1:2]), xlim=c(0,40), col="blue") # placebo
plot(npsurv(leukemia[!i,1:2]), add=TRUE, col="red")     # 6-MP

## purely interval-censored data
data(ap)
plot(npsurv(ap))

data(cancer)
cancerRT = with(cancer, cancer[group=="RT",1:2])
plot(npsurv(cancerRT), xlim=c(0,60))                  # survival of RT 
cancerRCT = with(cancer, cancer[group=="RCT",1:2])
plot(npsurv(cancerRCT), add=TRUE, col="green")        # survival of RCT 



