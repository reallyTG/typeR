library(gamlss.dist)


### Name: ZIP
### Title: Zero inflated poisson distribution for fitting a GAMLSS model
### Aliases: ZIP dZIP pZIP qZIP rZIP
### Keywords: distribution regression

### ** Examples

ZIP()# gives information about the default links for the normal distribution
# creating data and plotting them 
dat<-rZIP(1000, mu=5, sigma=.1)
r <- barplot(table(dat), col='lightblue')
# library(gamlss)
# fit the distribution 
# mod1<-gamlss(dat~1, family=ZIP)# fits a constant for mu and sigma 
# fitted(mod1)[1]
# fitted(mod1,"sigma")[1]



