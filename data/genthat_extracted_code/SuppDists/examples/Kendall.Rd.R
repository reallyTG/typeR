library(SuppDists)


### Name: Kendall
### Title: The distribution of Kendall's tau
### Aliases: dKendall pKendall qKendall rKendall sKendall
### Keywords: distribution

### ** Examples


pKendall(0, N=10)
pKendall(c(-.42,0.02,.42), N=10) ## approximately 5% 50% and 95% 
qKendall(.95,N=c(10,20))
sKendall(N=10)
plot(function(x)dKendall(x, N=10),-0.5,0.5)





