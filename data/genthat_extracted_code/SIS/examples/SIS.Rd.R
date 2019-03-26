library(SIS)


### Name: SIS
### Title: (Iterative) Sure Independence Screening ((I)SIS) and Fitting in
###   Generalized Linear Models and Cox's Proportional Hazards Models
### Aliases: SIS
### Keywords: models

### ** Examples



set.seed(0)
n = 400; p = 50; rho = 0.5
corrmat = diag(rep(1-rho, p)) + matrix(rho, p, p)
corrmat[,4] = sqrt(rho)
corrmat[4, ] = sqrt(rho)
corrmat[4,4] = 1
corrmat[,5] = 0
corrmat[5, ] = 0
corrmat[5,5] = 1
cholmat = chol(corrmat)
x = matrix(rnorm(n*p, mean=0, sd=1), n, p)
x = x%*%cholmat

# gaussian response 
set.seed(1)
b = c(4,4,4,-6*sqrt(2),4/3)
y=x[, 1:5]%*%b + rnorm(n)
model11=SIS(x, y, family='gaussian', tune='bic')
model12=SIS(x, y, family='gaussian', tune='bic', varISIS='aggr', seed=11)
model11$ix
model12$ix

## Not run: 
##D # binary response 
##D set.seed(2)
##D feta = x[, 1:5]%*%b; fprob = exp(feta)/(1+exp(feta))
##D y = rbinom(n, 1, fprob)
##D model21=SIS(x, y, family='binomial', tune='bic')
##D model22=SIS(x, y, family='binomial', tune='bic', varISIS='aggr', seed=21)
##D model21$ix
##D model22$ix
##D 
##D # poisson response
##D set.seed(3)
##D b = c(0.6,0.6,0.6,-0.9*sqrt(2))
##D myrates = exp(x[, 1:4]%*%b)
##D y = rpois(n, myrates)
##D model31=SIS(x, y, family='poisson', penalty = 'lasso', tune='bic', perm=TRUE, q=0.9, 
##D             greedy=TRUE, seed=31)
##D model32=SIS(x, y, family='poisson', penalty = 'lasso',  tune='bic', varISIS='aggr', 
##D             perm=TRUE, q=0.9, seed=32)
##D model31$ix
##D model32$ix
##D 
##D # Cox model
##D set.seed(4)
##D b = c(4,4,4,-6*sqrt(2),4/3)
##D myrates = exp(x[, 1:5]%*%b)
##D Sur = rexp(n,myrates); CT = rexp(n,0.1)
##D Z = pmin(Sur,CT); ind = as.numeric(Sur<=CT)
##D y = survival::Surv(Z,ind)
##D model41=SIS(x, y, family='cox', penalty='lasso', tune='bic', 
##D            varISIS='aggr', seed=41)
##D model42=SIS(x, y, family='cox', penalty='lasso', tune='bic', 
##D              varISIS='cons', seed=41)
##D model41$ix
##D model42$ix
## End(Not run)




