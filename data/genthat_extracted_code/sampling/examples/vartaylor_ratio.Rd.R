library(sampling)


### Name: vartaylor_ratio
### Title: Taylor-series linearization variance estimation of a ratio
### Aliases: vartaylor_ratio
### Keywords: survey

### ** Examples

data(belgianmunicipalities)
attach(belgianmunicipalities)
# inclusion probabilities, sample size 200
pik=inclusionprobabilities(Tot04,200)
# the first variable (population level)
Y=Men04
# the second variable (population level)
X=Women04
# population size
N=length(pik)             
# joint inclusion probabilities for Poisson sampling
pikl=outer(pik,pik,"*")
# draw a sample using Poisson sampling 
s=UPpoisson(pik)           
# sample inclusion probabilities
piks=pik[s==1]            
# the first observed variable
Ys=Y[s==1]
# the second observed variable
Xs=X[s==1]              
# matrix of joint inclusion prob. (sample level)          
pikls=pikl[s==1,s==1] 
# ratio estimator and its estimated variance
vartaylor_ratio(Ys,Xs,pikls)



