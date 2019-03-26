library(steadyICA)


### Name: dcovustat
### Title: Calculate distance covariance via U-statistics
### Aliases: dcovustat
### Keywords: distance covariance dcov

### ** Examples

x = rnorm(5000)
y = rbinom(5000,1,0.5)
y = y - 1*(y==0)
z = y*exp(-x) #some non-linear dependence

dcovustat(x[1:1000],y[1:1000]) #close to zero

a = Sys.time()
dcovustat(x[1:1000],z[1:1000]) #greater than zero
a = Sys.time() - a

#measures of linear dependence close to zero:
cov(x,z)
cor(rank(x),rank(z))


## Not run: 
##D #dcovustat differs from energy::dcov but are equal in the limit
##D library(energy)
##D b = Sys.time()
##D (dcov(x[1:1000],z[1:1000]))^2
##D b = Sys.time() - b
##D as.double(b)/as.double(a) #dcovustat is much faster
##D 
##D ## energy::dcov and dcovustat become approximately equal as n increases:
##D c = Sys.time()
##D dcovustat(x,z)
##D c = difftime(Sys.time(), c, sec)
##D d = Sys.time()
##D (dcov(x,z)^2)
##D d = difftime(Sys.time(), d, sec)
##D as.double(d)/as.double(c) 
## End(Not run)



