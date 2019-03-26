library(feature)


### Name: featureSignifGUI
### Title: GUI for feature significance for kernel density estimation
### Aliases: featureSignifGUI
### Keywords: smooth

### ** Examples

## No test: 
library(MASS)
data(geyser)
duration <- geyser$duration 
featureSignifGUI(duration)  ## univariate example
featureSignifGUI(geyser)    ## bivariate example

data(earthquake)            ## trivariate example
earthquake$depth <- -log10(-earthquake$depth)
featureSignifGUI(earthquake, scaleData=TRUE)
## End(No test)



