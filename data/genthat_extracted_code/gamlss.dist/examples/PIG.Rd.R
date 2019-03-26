library(gamlss.dist)


### Name: PIG
### Title: The Poisson-inverse Gaussian distribution for fitting a GAMLSS
###   model
### Aliases: PIG dPIG pPIG qPIG rPIG ZIPIG dZIPIG pZIPIG qZIPIG rZIPIG
###   ZAPIG dZAPIG pZAPIG qZAPIG rZAPIG
### Keywords: distribution regression

### ** Examples

PIG()# gives information about the default links for the  Poisson-inverse Gaussian distribution 
#plot the pdf using plot 
plot(function(y) dPIG(y, mu=10, sigma = 1 ), from=0, to=50, n=50+1, type="h") # pdf
# plot the cdf
plot(seq(from=0,to=50),pPIG(seq(from=0,to=50), mu=10, sigma=1), type="h")   # cdf
# generate random sample
tN <- table(Ni <- rPIG(100, mu=5, sigma=1))
r <- barplot(tN, col='lightblue')
# fit a model to the data 
# library(gamlss)
# gamlss(Ni~1,family=PIG)
ZIPIG()
ZAPIG()



