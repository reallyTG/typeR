library(gamlss.dist)


### Name: SI
### Title: The Sichel dustribution for fitting a GAMLSS model
### Aliases: SI dSI pSI qSI rSI tofyS
### Keywords: distribution regression

### ** Examples

SI()# gives information about the default links for the  Sichel distribution 
#plot the pdf using plot 
plot(function(y) dSI(y, mu=10, sigma=1, nu=1), from=0, to=100, n=100+1, type="h") # pdf
# plot the cdf
plot(seq(from=0,to=100),pSI(seq(from=0,to=100), mu=10, sigma=1, nu=1), type="h")   # cdf
# generate random sample
tN <- table(Ni <- rSI(100, mu=5, sigma=1, nu=1))
r <- barplot(tN, col='lightblue')
# fit a model to the data 
# library(gamlss)
# gamlss(Ni~1,family=SI, control=gamlss.control(n.cyc=50))



