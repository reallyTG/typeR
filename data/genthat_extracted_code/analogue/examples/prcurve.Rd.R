library(analogue)


### Name: prcurve
### Title: Fits a principal curve to m-dimensional data
### Aliases: prcurve initCurve print.prcurve
### Keywords: multivariate nonparametric smooth

### ** Examples

## Load Abernethy Forest data set
data(abernethy)

## Remove the Depth and Age variables
abernethy2 <- abernethy[, -(37:38)]

## Fit the principal curve using the median complexity over
## all species
aber.pc <- prcurve(abernethy2, method = "ca", trace = TRUE,
                   vary = FALSE, penalty = 1.4)

## Extract fitted values
fit <- fitted(aber.pc) ## locations on curve
abun <- fitted(aber.pc, type = "smooths") ## fitted response

## Fit the principal curve using varying complexity of smoothers
## for each species
aber.pc2 <- prcurve(abernethy2, method = "ca", trace = TRUE,
                    vary = TRUE, penalty = 1.4)

## Predict new locations
take <- abernethy2[1:10, ]
pred <- predict(aber.pc2, take)

## Not run: 
##D ## Fit principal curve using a GAM - currently slow ~10secs
##D aber.pc3 <- prcurve(abernethy2 / 100, method = "ca", trace = TRUE,
##D                     vary = TRUE, smoother = smoothGAM, bs = "cr", family = mgcv::betar())
## End(Not run)



