library(tram)


### Name: tram-methods
### Title: Methods for Stratified Linear Transformation Models
### Aliases: as.mlt.tram model.frame.tram model.matrix.tram coef.tram
###   coef.Lm coef.Survreg vcov.tram logLik.tram estfun.tram predict.tram
###   plot.tram

### ** Examples


    data("BostonHousing2", package = "mlbench")

    ### fit non-normal Box-Cox type linear model with two
    ### baseline functions (for houses near and off Charles River)
    BC_BH_2 <- BoxCox(cmedv | 0 + chas ~ crim + zn + indus + nox + 
                      rm + age + dis + rad + tax + ptratio + b + lstat,
                      data = BostonHousing2)
    logLik(BC_BH_2)

    ### classical likelihood inference
    summary(BC_BH_2)

    ### coefficients of the linear predictor
    coef(BC_BH_2)

    ### plot linear predictor (mean of _transformed_ response) 
    ### vs. observed values
    plot(predict(BC_BH_2, type = "lp"), BostonHousing2$cmedv)

    ### all coefficients
    coef(BC_BH_2, with_baseline = TRUE)

    ### compute predicted median along with 10% and 90% quantile for the first
    ### observations
    predict(BC_BH_2, newdata = BostonHousing2[1:3,], type = "quantile",
            prob = c(.1, .5, .9))

    ### plot the predicted density for these observations
    plot(BC_BH_2, newdata = BostonHousing2[1:3, -1],
         which = "distribution", type = "density", K = 1000)

    ### evaluate the two baseline transformations, with confidence intervals
    nd <- model.frame(BC_BH_2)[1:2, -1]
    nd$chas <- factor(c("0", "1"))
    library("colorspace")
    col <- diverge_hcl(2, h = c(246, 40), c = 96, l = c(65, 90))
    fill <- diverge_hcl(2, h = c(246, 40), c = 96, l = c(65, 90), alpha = .3)
    plot(BC_BH_2, which = "baseline only", newdata = nd, col = col,
         confidence = "interval", fill = fill, lwd = 2,
         xlab = "Median Value", ylab = expression(h[Y]))
    legend("bottomright", lty = 1, col = col, 
            title = "Near Charles River", legend = c("no", "yes"), bty = "n")




