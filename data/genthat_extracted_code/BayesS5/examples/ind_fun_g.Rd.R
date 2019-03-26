library(BayesS5)


### Name: ind_fun_g
### Title: Zellner's g-prior
### Aliases: ind_fun_g
### Keywords: Shotgun Stochastic Search Bayesian variable selection g-prior
###   nonlocal prior piMoM peMoM

### ** Examples

#p=5000
p = 10
n = 200

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

C0 = 1 # the number of repetitions of S5 algorithms to explore the model space
tuning = p^2 # tuning parameter g for g-prior
ind_fun = ind_fun_g # choose the pror on the regression coefficients (g-prior in this case)
model = Uniform #choose the model prior (Uniform prior in this cases)
tem =  seq(0.4,1,length.out=20)^2 # the sequence of the temperatures

fit_g = S5(X,y,ind_fun=ind_fun,model=model, tuning=tuning,tem=tem,C0=C0)



