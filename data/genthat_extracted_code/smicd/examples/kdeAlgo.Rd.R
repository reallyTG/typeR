library(smicd)


### Name: kdeAlgo
### Title: Estimation of Statistical Indicators from Interval Censored Data
### Aliases: kdeAlgo

### ** Examples

## Not run: 
##D # Generate data
##D x=rlnorm(500, meanlog = 8, sdlog = 1)
##D classes <- c(0,500,1000,1500,2000,2500,3000,4000,5000, 6000,8000,10000, 15000,Inf)
##D xclass <- cut(x,breaks=classes)
##D weights <- abs(rnorm(500,0,1))
##D oecd <- rep(seq(1,6.9,0.3),25)
##D 
##D # Estimate statistical indicators with default settings
##D Indicator <- kdeAlgo(xclass = xclass, classes = classes)
##D 
##D # Include custom indicators
##D Indicator_custom <- kdeAlgo(xclass = xclass, classes = classes,
##D custom_indicator = list(quant5 = function(y, threshold)
##D {quantile(y, probs = 0.05)}))
##D 
##D # Indclude survey and oecd weights
##D Indicator_weights <- kdeAlgo(xclass = xclass, classes = classes,
##D weights = weights, oecd = oecd)
## End(Not run) ## Don't show: 
# Generate data
x=rlnorm(500, meanlog = 8, sdlog = 1)
classes <- c(0,500,1000,1500,2000,2500,3000,4000,5000, 6000,8000,10000, 15000,Inf)
xclass <- cut(x,breaks=classes)

# Estimate statistical indicators
Indicator <- kdeAlgo(xclass = xclass, classes = classes, burnin = 10, samples = 40)
## End(Don't show)



