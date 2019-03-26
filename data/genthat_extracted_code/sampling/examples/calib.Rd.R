library(sampling)


### Name: calib
### Title: g-weights of the calibration estimator
### Aliases: calib
### Keywords: survey

### ** Examples

############
## Example 1
############
# matrix of sample calibration variables 
Xs=cbind(
c(1,1,1,1,1,0,0,0,0,0),
c(0,0,0,0,0,1,1,1,1,1),
c(1,2,3,4,5,6,7,8,9,10)
)
# inclusion probabilities
piks=rep(0.2,times=10)
# vector of population totals
total=c(24,26,290)
# the g-weights using the truncated method
g=calib(Xs,d=1/piks,total,method="truncated",bounds=c(0.75,1.2))
# the calibration estimator of X is equal to 'total' vector
tcal=t(g/piks)%*%Xs
# the g-weights are between lower and upper bounds
g
############
## Example 2
############
# Example of g-weights (linear, raking, truncated, logit),
# with the data of Belgian municipalities as population.
# Firstly, a sample is selected by means of Poisson sampling.
# Secondly, the g-weights are calculated.
data(belgianmunicipalities)
attach(belgianmunicipalities)
# matrix of calibration variables for the population
X=cbind(
Men03/mean(Men03),
Women03/mean(Women03),
Diffmen,
Diffwom,
TaxableIncome/mean(TaxableIncome),
Totaltaxation/mean(Totaltaxation),
averageincome/mean(averageincome),
medianincome/mean(medianincome))
# selection of a sample with expectation size equal to 200
# by means of Poisson sampling
# the inclusion probabilities are proportional to the average income 
pik=inclusionprobabilities(averageincome,200)
N=length(pik)               # population size
s=UPpoisson(pik)            # sample
Xs=X[s==1,]                 # sample matrix of calibration variables
piks=pik[s==1]              # sample inclusion probabilities
n=length(piks)              # sample size
# vector of population totals of the calibration variables
total=c(t(rep(1,times=N))%*%X)  
# the population total 
total
# computation of the g-weights
# by means of different calibration methods.
g1=calib(Xs,d=1/piks,total,method="linear")
g2=calib(Xs,d=1/piks,total,method="raking")
g3=calib(Xs,d=1/piks,total,method="truncated",bounds=c(0.5,1.5))
g4=calib(Xs,d=1/piks,total,method="logit",bounds=c(0.5,1.5))
# In some cases, the calibration does not exist
# particularly when bounds are used.
# if the calibration is possible, the calibration estimator of Xs is printed
if(checkcalibration(Xs,d=1/piks,total,g1)$result) 
    print(c((g1/piks) %*% Xs)) else print("error")
if(!is.null(g2))
    if(checkcalibration(Xs,d=1/piks,total,g2)$result) 
        print(c((g2/piks) %*% Xs)) else print("error")
if(!is.null(g3))
    if(checkcalibration(Xs,d=1/piks,total,g3)$result) 
        print(c((g3/piks) %*% Xs)) else print("error")
if(!is.null(g4))
    if(checkcalibration(Xs,d=1/piks,total,g4)$result) 
        print(c((g4/piks) %*% Xs)) else print("error")
############
## Example 3
############
# Example of calibration and adjustment for nonresponse in the 'calibration' vignette
vignette("calibration", package="sampling")



