library(mboost)


### Name: FP
### Title: Fractional Polynomials
### Aliases: FP
### Keywords: datagen

### ** Examples


    data("bodyfat", package = "TH.data")
    tbodyfat <- bodyfat

    ### map covariates into [1, 2]
    indep <- names(tbodyfat)[-2]
    tbodyfat[indep] <- lapply(bodyfat[indep], function(x) {
        x <- x - min(x)
        x / max(x) + 1
    })

    ### generate formula
    fpfm <- as.formula(paste("DEXfat ~ ",
        paste("FP(", indep, ", scaling = FALSE)", collapse = "+")))
    fpfm

    ### fit linear model
    bf_fp <- glmboost(fpfm, data = tbodyfat,
                      control = boost_control(mstop = 3000))

    ### when to stop
    mstop(aic <- AIC(bf_fp))
    plot(aic)

    ### coefficients
    cf <- coef(bf_fp[mstop(aic)])
    length(cf)
    cf[abs(cf) > 0]




