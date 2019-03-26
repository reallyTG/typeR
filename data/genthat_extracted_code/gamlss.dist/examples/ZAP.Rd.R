library(gamlss.dist)


### Name: ZAP
### Title: Zero adjusted poisson distribution for fitting a GAMLSS model
### Aliases: ZAP dZAP pZAP qZAP rZAP
### Keywords: distribution regression

### ** Examples

ZAP()
# creating data and plotting them 
dat<-rZAP(1000, mu=5, sigma=.1)
r <- barplot(table(dat), col='lightblue')



