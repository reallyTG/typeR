library(glarma)


### Name: Asthma
### Title: Daily Presentations of Asthma at Campbelltown Hospital
### Aliases: Asthma
### Keywords: datasets

### ** Examples

### Example with asthma data
data(Asthma)
y <- Asthma[,1]
X <- as.matrix(Asthma[,2:16])

## Model in Davis, Dunsmuir and Streett (2003)

## MA(7) specification - see Davis, Dunsmuir and Streett (2003)

## Pearson Residuals, Fisher Scoring
glarmamod <- glarma(y, X, thetaLags = 7, type = "Poi", method = "FS",
                    residuals = "Pearson", maxit = 100, grad = 1e-6)
glarmamod
summary(glarmamod)

likTests(glarmamod)
plot.glarma(glarmamod)

## Not run: 
##D ## Example is specified as \dontrun because it takes too long
##D ## for package inclusion on CRAN
##D 
##D ## Pearson Residuals, Newton Raphson, Negative Binomial
##D ## Initial value of the shape parameter take to be zero
##D glarmamod <- glarma(y, X, thetaLags = 7, type = "NegBin", method = "NR",
##D                     residuals = "Pearson", alphaInit = 0,
##D                     maxit = 100, grad = 1e-6)
##D glarmamod
##D summary(glarmamod)
##D 
##D likTests(glarmamod)
##D plot.glarma(glarmamod)
## End(Not run)




