library(SurvGSD)


### Name: General.tau
### Title: Information fractions under a generalized gamma survival
###   distribution or a log-logistic survival distribution.
### Aliases: General.tau

### ** Examples

General.tau(t=c(1,1.5,2,2.5), R=2, T=3, FUN.C=function(y) punif(y,0,7.018),
         q=1, mu=0.367, sigma=1, rho=0, eta=1, theta=0)
General.tau(t=c(1,1.5,2,2.5), R=2, T=3, FUN.C=function(y) punif(y,0,7.211),
         q="LLG", mu=1, sigma=1.75, rho=0, eta=1, theta=0)



