library(gamlss.dist)


### Name: GPO
### Title: The generalised Poisson distribution
### Aliases: GPO dGPO pGPO qGPO rGPO
### Keywords: distribution regression

### ** Examples

GPO()# gives information about the default links for the
#plot the pdf using plot 
plot(function(y) dGPO(y, mu=10, sigma=1 ), from=0, to=100, n=100+1, type="h") # pdf
# plot the cdf
plot(seq(from=0,to=100),pGPO(seq(from=0,to=100), mu=10, sigma=1), type="h")   # cdf
# generate random sample
tN <- table(Ni <- rGPO(100, mu=5, sigma=1))
r <- barplot(tN, col='lightblue')



