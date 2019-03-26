library(distrMod)


### Name: returnlevelplot
### Title: Methods for Function returnlevelplot in Package 'distrMod'
### Aliases: returnlevelplot returnlevelplot-methods
###   returnlevelplot,ANY,ProbFamily-method
###   returnlevelplot,ANY,UnivariateDistribution-method
###   returnlevelplot,ANY,Estimate-method
### Keywords: hplot distribution

### ** Examples

returnlevelplot(r(Norm(15,sqrt(30)))(40), Chisq(df=15))
### more could be seen after installing RobExtremes and ismev
#
if(require(RobExtremes) && require(ismev)){

 data(portpirie)
 gevfit <- gev.fit(portpirie[,2]) ## taken from example from ismev::gev.fit
 GEVF <- GEVFamily(scale=gevfit$mle[2],shape=gevfit$mle[3],loc=gevfit$mle[1])
 erg <- returnlevelplot(portpirie[,2], GEVF)
 print(erg)
 returnlevelplot(portpirie[,2], GEVF, datax=TRUE)

 data(rain)
 gpdfit <- gpd.fit(rain,10) ## taken from example from ismev::gpd.fit
 GPDF <- GParetoFamily(scale=gpdfit$mle[1],shape=gpdfit$mle[2],loc=10)
 returnlevelplot(rain, GPDF, MaxOrPOT="POT", xlim=c(1e-1,1e3))
}


