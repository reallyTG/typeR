library(BayesS5)


### Name: result_est_LS
### Title: Posterior inference results from the object of S5
### Aliases: result_est_LS
### Keywords: Simplified Shotgun Stochastic Search with Screening Shotgun
###   Stochastic Search Bayesian variable selection g-prior nonlocal prior
###   piMoM peMoM

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
y = X%*%bt0 + rnorm(n)*sqrt(1.5)
X = scale(X)
y = y-mean(y)
y = as.vector(y)

### piMoM  
#C0 = 2 # the number of repetitions of S5 algorithms to explore the model space
#tuning = 10 # tuning parameter
#tuning = hyper_par(type="pimom",X,y,thre = p^-0.5)
#print(tuning)
#ind_fun = ind_fun_pimom # choose the prior on the regression coefficients (pimom in this case)
#model = Bernoulli_Uniform # choose the model prior 
#tem =  seq(0.4,1,length.out=20)^2 # the sequence of the temperatures

#fit_pimom = S5(X,y,ind_fun=ind_fun,model = model,tuning=tuning,tem=tem,C0=C0)
#fit_pimom$GAM # the searched models by S5
#fit_pimom$OBJ # the corresponding log (unnormalized) posterior probability

#res_pimom = result(fit_pimom)
#est.LS = result_est_LS(res_pimom,X,y,obj_fun_pimom,verbose=TRUE)
#plot(est.LS$beta.MAP,est.LS$beta.BMA)
#abline(0,1,col="red")



