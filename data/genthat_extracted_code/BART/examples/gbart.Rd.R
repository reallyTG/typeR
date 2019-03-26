library(BART)


### Name: gbart
### Title: Generalized BART for continuous and binary outcomes
### Aliases: gbart mc.gbart
### Keywords: nonparametric tree regression nonlinear

### ** Examples

##simulate data (example from Friedman MARS paper)
f = function(x){
10*sin(pi*x[,1]*x[,2]) + 20*(x[,3]-.5)^2+10*x[,4]+5*x[,5]
}
sigma = 1.0  #y = f(x) + sigma*z , z~N(0,1)
n = 100      #number of observations
set.seed(99)
x=matrix(runif(n*10),n,10) #10 variables, only first 5 matter
Ey = f(x)
y=Ey+sigma*rnorm(n)
lmFit = lm(y~.,data.frame(x,y)) #compare lm fit to BART later

##test BART with token run to ensure installation works
set.seed(99)
bartFit = wbart(x,y,nskip=5,ndpost=5)

## Not run: 
##D ##run BART
##D set.seed(99)
##D bartFit = wbart(x,y)
##D 
##D ##compare BART fit to linear matter and truth = Ey
##D fitmat = cbind(y,Ey,lmFit$fitted,bartFit$yhat.train.mean)
##D colnames(fitmat) = c('y','Ey','lm','bart')
##D print(cor(fitmat))
## End(Not run)



