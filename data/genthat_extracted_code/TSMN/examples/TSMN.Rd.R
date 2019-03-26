library(TSMN)


### Name: TSMN
### Title: Truncated Scale Mixtures of Normal Distributions
### Aliases: TSMN
### Keywords: truncated scale mixtures of normal distribution tsmn

### ** Examples

## A test sample to compare theoretical and empirical moments, considering the following parameters:

mu = 2
sigma2 = 4
nu = 5
lower = -3
upper = 10
dist = "T"
n = 10000

## Theoretical moments with TSMNmoments
theor<-TSMNmoments(mu=mu, sigma2=sigma2, nu=nu, lower=lower, upper=upper, dist=dist)

## Generate the sample with TSMNgenerator to compute the empirical moments
empir<-TSMNgenerator(n=n, mu=mu, sigma2=sigma2, nu=nu, lower=lower, upper=upper, dist=dist)

## Compare the results
data.frame("1st" = c("Theoretic" = theor$EY1, "Empirical" = mean(empir)),
           "2nd" = c("Theoretic" = theor$EY2, "Empirical" = mean(empir^2)),
           "3rd" = c("Theoretic" = theor$EY3, "Empirical" = mean(empir^3)),
           "4th" = c("Theoretic" = theor$EY4, "Empirical" = mean(empir^4)))




