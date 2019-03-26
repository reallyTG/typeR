library(CDVine)


### Name: BiCopEst
### Title: Parameter estimation for bivariate copula data using inversion
###   of Kendall's tau or maximum likelihood estimation
### Aliases: BiCopEst

### ** Examples

## Example 1: bivariate Gaussian copula
dat = BiCopSim(500,1,0.7)
u1 = dat[,1]
v1 = dat[,2]

# empirical Kendall's tau
tau1 = cor(u1,v1,method="kendall")

# inversion of empirical Kendall's tau 
BiCopTau2Par(1,tau1)
BiCopEst(u1,v1,family=1,method="itau")$par

# maximum likelihood estimate for comparison
BiCopEst(u1,v1,family=1,method="mle")$par


## Example 2: bivariate Clayton and survival Gumbel copulas
# simulate from a Clayton copula
dat = BiCopSim(500,3,2.5)
u2 = dat[,1]
v2 = dat[,2]

# empirical Kendall's tau
tau2 = cor(u2,v2,method="kendall")

# inversion of empirical Kendall's tau for the Clayton copula
BiCopTau2Par(3,tau2)
BiCopEst(u2,v2,family=3,method="itau",se=TRUE) 

# inversion of empirical Kendall's tau for the survival Gumbel copula
BiCopTau2Par(14,tau2)
BiCopEst(u2,v2,family=14,method="itau",se=TRUE)

# maximum likelihood estimates for comparison
BiCopEst(u2,v2,family=3,method="mle",se=TRUE)
BiCopEst(u2,v2,family=14,method="mle",se=TRUE)

## Example 3: fit of a t-copula to standardized residuals of
## S&P 500 and DAX returns
data(worldindices)
BiCopEst(worldindices[,1],worldindices[,4],family=2,method="mle",se=TRUE) 



