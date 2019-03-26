library(unmarked)


### Name: backTransform-methods
### Title: Methods for Function backTransform in Package 'unmarked'
### Aliases: backTransform backTransform-methods
###   backTransform,unmarkedEstimate-method
###   backTransform,unmarkedFit-method backTransform,unmarkedLinComb-method
###   show,unmarkedBackTrans-method
### Keywords: methods

### ** Examples


data(mallard)
mallardUMF <- unmarkedFramePCount(mallard.y, siteCovs = mallard.site, 
    obsCovs = mallard.obs)

(fm <- pcount(~ 1 ~ forest, mallardUMF))    # Fit a model
backTransform(fm, type="det")               # This works because there are no detection covariates
#backTransform(fm, type="state")             # This doesn't work because covariates are present
lc <- linearComb(fm, c(1, 0), type="state") # Estimate abundance on the log scale when forest=0
backTransform(lc)                           # Abundance on the original scale



