library(BayesS5)


### Name: hyper_par
### Title: Tuning parameter selection for nonlocal priors
### Aliases: hyper_par
### Keywords: tuning pimom pemom

### ** Examples

p=50
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

# piMoM  
C0 = 1 # the number of repetitions of S5 algorithms to explore the model space
tuning = 10 # tuning parameter
#tuning = hyper_par(type="pimom",X,y,thre = p^-0.5)
print(tuning)



