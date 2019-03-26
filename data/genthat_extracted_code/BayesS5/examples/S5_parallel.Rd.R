library(BayesS5)


### Name: S5_parallel
### Title: Parallel version of S5
### Aliases: S5_parallel
### Keywords: Shotgun Stochastic Search Bayesian variable selection g-prior
###   nonlocal prior piMoM peMoM

### ** Examples

p=5000
n = 100

indx.beta = 1:5
xd0 = rep(0,p);xd0[indx.beta]=1
bt0 = rep(0,p); 
bt0[1:5]=c(1,1.25,1.5,1.75,2)*sample(c(1,-1),5,replace=TRUE)
xd=xd0
bt=bt0
X = matrix(rnorm(n*p),n,p)
y = crossprod(t(X),bt0) + rnorm(n)*sqrt(1.5)
X = scale(X)
y = y-mean(y)
y = as.vector(y)

### parallel version of S5 (defalut)
#fit_parallel = S5_parallel(NC=2,X,y)
 

#fit_parallel$GAM # the searched models by S5
#fit_parallel$OBJ # the corresponding log (unnormalized) posterior probability

#res_parallel = result(fit_parallel)
#str(res_parallel)
#print(res_parallel$hppm) # the MAP model 
#print(res_parallel$hppm.prob) # the posterior probability of the hppm 
#plot(res_parallel$marg.prob,ylim=c(0,1),ylab="marginal inclusion probability") 
# the marginal inclusion probability 

### parallel version of S5 (temperature rescheduling)
#library(snowfall)
#NC = 2 # the number of cores for the prallel computing
#C0 = 5 # the number of repetitions of S5 algorithms to explore the model space
#tuning = hyper_par(type="pimom",X,y,thre = p^-0.5)  
# tuning parameter selection for nonlocal priors
#print(tuning) 

#ind_fun = ind_fun_pimom 
#model = Bernoulli_Uniform 
# the log-marginal likelihood of models based on piMoM prior 
#('Uniform' or 'Bernoulli_Uniform').
#tem =  seq(0.4,1,length.out=20)^2 
# the temperatures schedule
#fit_parallel = S5_parallel(NC=2,X,y,ind_fun,model,tuning,tem,C0=C0)
 

#fit_parallel$GAM # the searched models by S5
#fit_parallel$OBJ # the corresponding log (unnormalized) posterior probability

#res_parallel = result(fit_parallel)
#str(res_parallel)
#print(res_parallel$hppm) # the MAP model 
#print(res_parallel$hppm.prob) # the posterior probability of the hppm 
#plot(res_parallel$marg.prob,ylim=c(0,1),ylab="marginal inclusion probability") 
# the marginal inclusion probability 



