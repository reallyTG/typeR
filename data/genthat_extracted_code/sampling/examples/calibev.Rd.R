library(sampling)


### Name: calibev
### Title: Calibration estimator and its variance estimation
### Aliases: calibev
### Keywords: survey

### ** Examples

############
## Example
############
# Example of g-weights (linear, raking, truncated, logit),
# with the data of Belgian municipalities as population.
# Firstly, a sample is selected by means of systematic sampling.
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
# selection of a sample of size 200
# using systematic sampling
# the inclusion probabilities are proportional to the average income 
pik=inclusionprobabilities(averageincome,200)
N=length(pik)               # population size
s=UPsystematic(pik)         # draws a sample s using systematic sampling    
Xs=X[s==1,]                 # matrix of sample calibration variables
piks=pik[s==1]              # sample inclusion probabilities
n=length(piks)              # sample size
# vector of population totals of the calibration variables
total=c(t(rep(1,times=N))%*%X)  
g1=calib(Xs,d=1/piks,total,method="linear") # computes the g-weights
pikl=UPsystematicpi2(pik)   # computes the matrix of the joint inclusion probabilities 
pikls=pikl[s==1,s==1]       # the same matrix for the units in s
Ys=Tot04[s==1]          # the variable of interest is Tot04 (for the units in s)
calibev(Ys,Xs,total,pikls,d=1/piks,g1,with=FALSE,EPS=1e-6)



