library(WEE)


### Name: WEE.linear
### Title: WEE linear regression
### Aliases: WEE.linear

### ** Examples

## Generate simulated data
# set population size as 500000
n = 500000

# set parameters
beta = c(0.2, 0.1) # P(Y|X,Z)
gamma = c(0.3, log(2), log(2)) #P(D|X,Y,Z)

# generate the genetic variant X
x = rbinom(n,size=2,prob=0.3)

# generate the standardized continuous covariate Z correlated with X
z = rnorm(n, mean=0.5*x-0.3, sd=1)

# generate the continuous secondary trait Y
y = 1+beta[1]*x+beta[2]*z+rnorm(n)

# generate the primary disease D
alpha = -3.62
pd = exp(alpha + x*gamma[1] + y*log(2)+ z*log(2)) /
         (1+exp(alpha+ x*gamma[1] + y*log(2)+ z*log(2)))
d = rbinom(n,size=1,prob=pd)

# form population data set
dat=as.data.frame(cbind(d, y, z, x))

# generate sample dataset with 200 cases and 200 controls
dat_cases = dat[which(dat$d==1),]
dat_controls= dat[which(dat$d==0),]
dat_cases_sample = dat_cases[sample(sum(dat$d==1),
                             200, replace=FALSE),]
dat_controls_sample = dat_controls[sample(sum(dat$d==0),
                                  200, replace=FALSE),]
  
dat_linear=rbind(dat_cases_sample,dat_controls_sample)
colnames(dat_linear)=c("D", "y", "z","x")
D = dat_linear$D # Disease status
pD = sum(dat$d == 1)/500000 # Population disease prevalence

## WEE linear regresssion
WEE.linear(y ~ x + z, D, 
           data = dat_linear, pD)   
## No test: 
WEE.linear(y ~ x + z, D, 
           data = dat_linear, pD, boot = 500) 
## End(No test)



