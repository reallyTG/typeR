library(gamlss.dist)


### Name: ZIP2
### Title: Zero inflated poisson distribution for fitting a GAMLSS model
### Aliases: ZIP2 dZIP2 pZIP2 qZIP2 rZIP2
### Keywords: distribution regression

### ** Examples

ZIP2()# gives information about the default links for the normal distribution
# creating data and plotting them 
dat<-rZIP2(1000, mu=5, sigma=.1)
r <- barplot(table(dat), col='lightblue')
# fit the disteibution
# library(gamlss) 
# mod1<-gamlss(dat~1, family=ZIP2)# fits a constant for mu and sigma 
# fitted(mod1)[1]
# fitted(mod1,"sigma")[1]



