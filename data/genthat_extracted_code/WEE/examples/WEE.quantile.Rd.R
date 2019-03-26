library(WEE)


### Name: WEE.quantile
### Title: WEE quantile regression
### Aliases: WEE.quantile

### ** Examples

## Generate simulated data
# set population size as 500000
n = 500000 

# set parameters
beta = c(0.12, 0.1) # P(Y|X,Z)
gamma = c(-4, log(1.5), log(1.5), log(2) ) #P(D|X,Y,Z)

# generate the genetic variant X
x = rbinom(n,size=2,prob=0.3)
  
# generate the continuous covariate Z
z = rnorm(n)
  
# generate the continuous secondary trait Y
y= 1 + beta[1]*x + beta[2]*z + (1+0.02*x)*rnorm(n)

# generate disease status D
p = exp(gamma[1]+x*gamma[2]+z*gamma[3]+y*gamma[4])/
(1+exp(gamma[1]+x*gamma[2]+z*gamma[3]+y*gamma[4]))
d = rbinom(n,size=1,prob=p)

# form population data dataset
dat = as.data.frame(cbind(x,y,z,d))
colnames(dat) = c("x","y","z","d")

# Generate sample dataset with 200 cases and 200 controls
dat_cases = dat[which(dat$d==1),]
dat_controls= dat[which(dat$d==0),]
dat_cases_sample = dat_cases[sample(sum(dat$d==1),
                             200, replace=FALSE),]
dat_controls_sample = dat_controls[sample(sum(dat$d==0),
                                   200, replace=FALSE),]

dat_quantile = as.data.frame(rbind(dat_cases_sample,
                                   dat_controls_sample))
colnames(dat_quantile) = c("x","y","z","D")
D = dat_quantile$D # Disease status
pd = sum(d==1)/n # population disease prevalence

# WEE quantile regressions:
WEE.quantile(y ~ x, D, tau = 0.5, 
             data = dat_quantile, pd_pop = pd)	  				
## No test: 
WEE.quantile(y ~ x + z, D, tau = 1:9/10, 
             data = dat_quantile, pd_pop = pd, boot = 500)
## End(No test)



