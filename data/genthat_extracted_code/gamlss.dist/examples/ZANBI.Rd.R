library(gamlss.dist)


### Name: ZANBI
### Title: Zero inflated and zero adjusted negative binomial distributions
###   for fitting a GAMLSS model
### Aliases: ZANBI dZANBI pZANBI qZANBI rZANBI ZINBI dZINBI pZINBI qZINBI
###   rZINBI
### Keywords: distribution regression

### ** Examples

ZINBI() 
ZANBI()
# creating data and plotting them 
 dat <- rZINBI(1000, mu=5, sigma=.5, nu=0.1)
   r <- barplot(table(dat), col='lightblue')
dat1 <- rZANBI(1000, mu=5, sigma=.5, nu=0.1)
   r1 <- barplot(table(dat1), col='lightblue')



