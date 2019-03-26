library(gamlss.dist)


### Name: ZABB
### Title: Zero inflated and zero adjusted Binomial distribution for
###   fitting in GAMLSS
### Aliases: ZABB dZABB pZABB qZABB rZABB ZIBB dZIBB pZIBB qZIBB rZIBB
### Keywords: distribution regression

### ** Examples

ZIBB() 
ZABB()
# creating data and plotting them 
 dat <- rZIBB(1000, mu=.5, sigma=.5, nu=0.1, bd=10)
   r <- barplot(table(dat), col='lightblue')
dat1 <- rZABB(1000, mu=.5, sigma=.2, nu=0.1, bd=10)
   r1 <- barplot(table(dat1), col='lightblue')



