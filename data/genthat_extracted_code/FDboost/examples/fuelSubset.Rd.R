library(FDboost)


### Name: fuelSubset
### Title: Spectral data of fossil fuels
### Aliases: fuelSubset
### Keywords: datasets

### ** Examples


    data("fuelSubset", package = "FDboost")
    
    ## center the functional covariates per observed wavelength
    fuelSubset$UVVIS <- scale(fuelSubset$UVVIS, scale = FALSE)
    fuelSubset$NIR <- scale(fuelSubset$NIR, scale = FALSE)

    ## to make mboost::df2lambda() happy (all design matrix entries < 10)
    ## reduce range of argvals to [0,1] to get smaller integration weights
    fuelSubset$uvvis.lambda <- with(fuelSubset, (uvvis.lambda - min(uvvis.lambda)) /
                                          (max(uvvis.lambda) - min(uvvis.lambda) ))
    fuelSubset$nir.lambda <- with(fuelSubset, (nir.lambda - min(nir.lambda)) /
                                          (max(nir.lambda) - min(nir.lambda) ))


    ### fit mean regression model with 100 boosting iterations,
    ### step-length 0.1 and
    mod <- FDboost(heatan ~ bsignal(UVVIS, uvvis.lambda, knots=40, df=4, check.ident=FALSE)
                   + bsignal(NIR, nir.lambda, knots=40, df=4, check.ident=FALSE),
                   timeformula = NULL, data = fuelSubset)
    summary(mod)
    ## plot(mod)



