library(BayesS5)


### Name: S5
### Title: Simplified shotgun stochastic search algorithm with screening
###   (S5)
### Aliases: S5
### Keywords: Shotgun Stochastic Search Bayesian variable selection g-prior
###   nonlocal prior piMoM peMoM

### ** Examples

p0 = 5000
n0= 100

indx.beta = 1:5
xd0 = rep(0,p0);xd0[indx.beta]=1
bt0 = rep(0,p0); 
bt0[1:5]=c(1,1.25,1.5,1.75,2)*sample(c(1,-1),5,replace=TRUE)
xd=xd0
bt=bt0
X = matrix(rnorm(n0*p0),n0,p0)
y = crossprod(t(X),bt0) + rnorm(n0)*sqrt(1.5)
X = scale(X)
y = y-mean(y)
y = as.vector(y)

### default setting
#fit_default = S5(X,y)
#res_default = result(fit_default)
#print(res_default$hppm) # the MAP model 
#print(res_default$hppm.prob) # the posterior probability of the hppm 
#plot(res_default$marg.prob,ylim=c(0,1),ylab="marginal inclusion probability") 
# the marginal inclusion probability 

### Nonlocal prior (piMoM prior) by S5
#C0 = 1 # the number of repetitions of S5 algorithms to explore the model space
#tuning = hyper_par(type="pimom",X,y,thre = p^-0.5)  
# tuning parameter selection for nonlocal priors
#print(tuning) 

#ind_fun = ind_fun_pimom # the log-marginal likelihood of models based on piMoM prior
#model = Bernoulli_Uniform 
# the log-marginal likelihood of models based on piMoM prior 
#tem =  seq(0.4,1,length.out=20)^2 
# the temperatures schedule
#fit_pimom = S5(X,y,ind_fun=ind_fun,model=model,tuning=tuning,tem=tem,C0=C0)


#fit_pimom$GAM # the searched models by S5
#fit_pimom$OBJ # the corresponding log (unnormalized) posterior probability

#res_pimom = result(fit_pimom)
#str(res_pimom)
#print(res_pimom$hppm) # the MAP model 
#print(res_pimom$hppm.prob) 
# the posterior probability of the hppm 
#plot(res_pimom$marg.prob,ylim=c(0,1),ylab="marginal inclusion probability") 
# the marginal inclusion probability 


### Get the estimated regression coefficients from Bayesian Model Avaeraging
#est.LS = result_est_LS(res_pimom,X,y) # Averged over the Least Square estimators.
#est.MAP = result_est_MAP(res_pimom,X,y,obj_fun_pimom,verbose=TRUE) 
# Averged over the MAP estimators.



