library(mosaic)


### Name: plotDist
### Title: Plots of Discrete and Continuous Distributions
### Aliases: plotDist
### Keywords: graphics stats

### ** Examples

plotDist('norm')
plotDist('norm', type='h')
plotDist('norm', kind='cdf')
plotDist('exp',  kind='histogram')
plotDist('binom', params=list( 25, .25))       # explicit params
plotDist('binom', 25, .25)                     # params inferred
plotDist('norm', mean=100, sd=10, kind='cdf')  # params inferred
plotDist('binom', 25, .25, xlim=c(-1,26) )     # params inferred
plotDist('binom', params=list( 25, .25), kind='cdf')
plotDist('beta', params=list( 3, 10), kind='density')
plotDist('beta', params=list( 3, 10), kind='cdf')
plotDist( "binom", params=list(35,.25), 
           groups= y < dbinom(qbinom(0.05, 35, .25), 35,.25) )
plotDist( "binom", params=list(35,.25), 
           groups= y < dbinom(qbinom(0.05, 35, .25), 35,.25), 
           kind='hist')
plotDist("norm", mean=10, sd=2, col="blue", type="h")
plotDist("norm", mean=12, sd=2, col="red", type="h", under=TRUE)
plotDist("binom", size=100, prob=.30) +
  plotDist("norm", mean=30, sd=sqrt(100 * .3 * .7))
plotDist("chisq", df=4, groups = x > 6, type="h")
plotDist("f", df1=1, df2 = 99)
if (require(mosaicData)) {
histogram( ~age|sex, data=HELPrct)
m <- mean( ~age|sex, data=HELPrct)
s <- sd(~age|sex, data=HELPrct)
plotDist( "norm", mean=m[1], sd=s[1], col="red", add=TRUE, packets=1)
plotDist( "norm", mean=m[2], sd=s[2], col="blue", under=TRUE, packets=2)
}




