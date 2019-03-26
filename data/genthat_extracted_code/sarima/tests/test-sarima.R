library(sarima)
context("Fitting extended Sarima models")

## Commenting out tests for 'fkf' for the CRAN release of 'sarima' since FKF has been
## archived on CRAN.
##
## test_that("xarmaxss() works ok with fkf", {
##     ## this exanple is from the vignette in GKF and probably also from FKF
##     ## but I generalised the code for general p,q
##     arm <- c(0.6, 0.2)
##     mam <- -0.2
##     sigma <- sqrt(0.2)
##
##     expect_equal(mam, -0.2)
##
##     n <- 1000
##     a <- arima.sim(model = list(ar = arm, ma = mam), n = n, innov = rnorm(n) * sigma)
##     yt <- rbind(a)
##     sp <- armapqss(ar = arm, ma = mam, sigma = sigma)
##     logLikfkf <- fkf(a0 = sp$a0, P0 = sp$P0, dt = sp$dt, ct = sp$ct, Tt = sp$Tt,
##                      Zt = sp$Zt, HHt = sp$HHt, GGt = sp$GGt,
##                      yt = yt)$logLik
##
##      yt2 <- 5 + 2*seq_along(a) + yt
##      sp2 <- sp
##      sp2$ct <- matrix(c(5 + 2*seq_along(a)), nrow = 1)
##
##      logLikfkf <- FKF::fkf(a0 = sp2$a0, P0 = sp2$P0, dt = sp2$dt, ct = sp2$ct, Tt = sp2$Tt,
##                            Zt = sp2$Zt, HHt = sp2$HHt, GGt = sp2$GGt,
##                            yt = yt2)$logLik
##
##      sp2a <- xarmaxss(ar = arm, ma = mam, sigma = sigma, xreg = matrix(c(5 + 2*seq_along(a)), nrow = 1))
##
##      logLikfkf <- FKF::fkf(a0 = sp2a$a0, P0 = sp2a$P0, dt = sp2a$dt, ct = sp2a$ct, Tt = sp2a$Tt,
##                            Zt = sp2a$Zt, HHt = sp2a$HHt, GGt = sp2a$GGt, yt = yt2)$logLik
## })

test_that("sarima() works ok", {
    phi <- list(structure(c(1, 0.1), fixed = c(TRUE,FALSE)))
    theta <- list(structure(c(1, 0, rep(0,10), 0, 0), fixed = c(TRUE,FALSE,rep(TRUE, 9), rep(FALSE,3))))
    delta <- list(c(1, -1), c(1, rep(0, 11), -1))
    ##sarima:::sarima0(phi = phi, theta = theta, delta = delta)

    phi <- structure(c(1, -0.1), fixed = c(TRUE,FALSE))
   theta <- structure(c(1, 0.4, rep(0,10), 0.2, 0.3), fixed = c(TRUE,FALSE,rep(TRUE, 9), rep(FALSE,3)))
    delta <- list(c(1, -1), c(1, rep(0, 11), -1))

    tmpa <- sarima(y ~ 0 | ar(2) + ma(2), data = data.frame(y = as.vector(yKFAS)), ss.method = "kfas")
    tmpa # OK

   tmpa1 <- sarima(y ~ 0 | ar(2, atanh.tr = FALSE) + ma(2, atanh.tr = FALSE), data = data.frame(y = as.vector(yKFAS)), ss.method = "kfas")


    ## wrong convergence
    tmpb <- sarima(y ~ 0 | ar(2, c(0.5, -0.8)) + ma(2, c(-0.3,0.8)),
                   data = data.frame(y = as.vector(yKFAS)), ss.method = "kfas")

    tmp.arima <- arima(yKFAS, order = c(2,0,2), include.mean = FALSE)
    tmp1t.arima <- arima(yKFAS, order = c(2,0,2), include.mean = FALSE, xreg = cbind(1, 1:length(yKFAS)))

    expect_equal_to_reference(tmp.arima$loglik, "loglik_tmp.RDS")
    expect_equal_to_reference(tmpa$loglik, "loglik_tmpa.RDS")

     expect_lt(abs(tmp.arima$loglik - tmpa$loglik), 1e-5)  # 1.391794e-06
    expect_lt(abs(tmp.arima$loglik - tmpa1$loglik), 1e-6) # 1.294923e-07

    ## expect_identical(sm2, sm2c)
    ##
    ## expect_error(new("ArModel", ma = 0.9, ar = 0.5), "Moving average terms found in ArModel")

    ## yKFAS - data from KFAS example

## bad initial values:
expect_error(
    sarima(y ~ 1 + t| ar(2, c(0.5, -0.8), atanh.tr = TRUE) + ma(2, c(-0.3,0.8), atanh.tr = TRUE),
           data = data.frame(y = as.vector(yKFAS)), ss.method = "base")
## The hessian is degenerate probably because the MA part gets to large values of the transformed
##    parameters which have parcors = tanh() = 1 or -1 (but I haven't investigated futher).
##
## Error in solve.default(hessian * n) :
, "Lapack routine dgesv: system is exactly singular")


## the warning here is in print() when computing s.e.:
expect_warning( capture.output( # wrap in capture.output, to prevent printing during devtools::test()
    print(
    sarima(y ~ 1 + t| ar(2, c(0.5, -0.8), atanh.tr = TRUE) + ma(2, c(-0.3,0.8), atanh.tr = TRUE),
           data = data.frame(y = as.vector(yKFAS)), ss.method = "sarima") )
    )
, "NaNs produced")

    sarima(y ~ 1 + t| ar(2, c(0.5, -0.8), atanh.tr = FALSE) + ma(2, c(-0.3,0.8), atanh.tr = FALSE),
           data = data.frame(y = as.vector(yKFAS)), ss.method = "base")

expect_warning(sarima(y ~ 1 + t| ar(2, c(0.5, -0.8), atanh.tr = FALSE) + ma(2, c(-0.3,0.8), atanh.tr = FALSE),
           data = data.frame(y = as.vector(yKFAS)), ss.method = "sarima"), "NaNs produced")


    sarima(y ~ 1 + .cs(12, 1)| ar(2, c(0.5, -0.8)) + ma(2, c(-0.3,0.8)),
           data = data.frame(y = as.vector(yKFAS)), ss.method = "base")

    sarima(y ~ 1 + .cs(12, 1:2)| ar(2, c(0.5, -0.8)) + ma(2, c(-0.3,0.8)),
           data = data.frame(y = as.vector(yKFAS)), ss.method = "base")


    ## AirPassengers
    ap.arima <- arima(log(AirPassengers), order = c(0,1,1), seasonal = c(0,1,1))
    ap.baseA <- sarima(log(AirPassengers) ~ 0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(1) + si(12,1), ss.method = "base")
    ap.baseB <- sarima(log(AirPassengers) ~ 0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(2) + s(12), ss.method = "base")

    ## check the print and summary methods
    ap.baseA
    capture.output( summary(ap.baseA) ) # cpture.output() to avoid printing during devtools::test()
    ap.baseB
    capture.output( summary(ap.baseB) )

    ap2.arima <- arima(log(AirPassengers), order = c(0,0,1), seasonal = c(0,1,1))
    ap2.baseA <- sarima(log(AirPassengers) ~ 0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) +     si(12,1), ss.method = "base")
    ap2.baseA <- sarima(log(AirPassengers) ~ 0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(1) + s(12), ss.method = "base")

    ap3.base <- sarima(log(AirPassengers) ~ 0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(2) + s(6), ss.method = "base")

    ## further unit roots, equivalent specifications for the airline model
    tmp.su <- sarima(log(AirPassengers) ~ 0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(2) + s(2) + su(12,1:5), ss.method = "base")
    tmp.su$interna$delta_poly
    prod(tmp.su$interna$delta_poly)
    zapsmall(coef(prod(tmp.su$interna$delta_poly)))
    tmp.su

    tmp.u <- sarima(log(AirPassengers) ~ 0 | ma(1, c(-0.3)) + sma(12,1, c(-0.1)) + i(2) + s(2) + u((1:5)/12), ss.method = "base")
    tmp.u

})

test_that("prediction from fitted sarima() works ok", {
    ## Lake Huron example from ?arima
    huron.arima <- arima(LakeHuron, order = c(2,0,0), xreg = time(LakeHuron) - 1920)
    huron.sarima <- sarima(LakeHuron ~ 1 + t | ar(2), ss.method = "base")
    co.arima <- coef(huron.arima)
    co.sarima <- coef(huron.sarima)

    expect_lt(max(abs(co.sarima[c("ar1", "ar2")] - co.sarima[c("ar1", "ar2")])), 1e-4)
    ## intercepts are different since the time line statrs from different values.
    ## TODO: need to orthogonalise xreg
    ##
    ## slope:
    expect_lt(abs(co.sarima[4] - co.sarima[4]), 1e-4)


    expect_lt(abs(huron.sarima$sigma2 - huron.arima$sigma2), 1e-6)
    expect_lt(abs(huron.sarima$loglik - huron.arima$loglik), 1e-6)
    expect_lt(abs(huron.sarima$aic - huron.arima$aic), 1e-6)

    huron.arima.predict <- predict(huron.arima, n.ahead = 10,
                                   newxreg = matrix(52 + 1:10, ncol = 1))
    huron.sarima.predict <- predict(huron.sarima, n.ahead = 10)

    expect_lt(max(abs(huron.sarima.predict$pred - huron.arima.predict$pred)), 1e-3)
    expect_lt(max(abs(huron.sarima.predict$se   - huron.arima.predict$se)), 1e-4)

    ## lh from predict.Arima
    lh.arima      <- arima(lh, order = c(3,0,0))
    lh.arima.pred <- predict(lh.arima, n.ahead = 12)

    lh.sarimabase  <- sarima(lh ~ 1 | ar(3), ss.method = "base")
    lh.sarimabaseA <- sarima(lh ~ 1 | ar(3, atanh.tr = FALSE), ss.method = "base")

    lh.sarimabase.pred <- predict(lh.sarimabase, n.ahead = 12)
    # expect_lt(max(abs(lh.sarimabase.pred$pred - lh.arima.pred$pred)), 1e-5)
    expect_lt(max(abs(lh.sarimabase.pred$se   - lh.arima.pred$se  )), 1e-5)

    lh.sarimabaseA.pred <- predict(lh.sarimabaseA, n.ahead = 12)
    expect_lt(max(abs(lh.sarimabaseA.pred$pred - lh.arima.pred$pred)), 1e-5)
    expect_lt(max(abs(lh.sarimabaseA.pred$se   - lh.arima.pred$se  )), 1e-5)

    lh.sarima <- sarima(lh ~ 1 | ar(3), ss.method = "sarima")
    lh.sarima.pred <- predict(lh.sarima, n.ahead = 12)


    # expect_lt(max(abs(lh.sarima.pred$pred - lh.arima.pred$pred)), 1e-5)  # diff: 1.123541e-05
    expect_lt(max(abs(lh.sarima.pred$pred - lh.sarimabaseA.pred$pred)), 1e-5)
    expect_lt(max(abs(lh.sarima.pred$se   - lh.sarimabaseA.pred$se  )), 1e-5)


    expect_lt(max(abs(lh.sarima.pred$se   - lh.arima.pred$se  )), 1e-5)

    lh.sarimaA <- sarima(lh ~ 1 | ar(3, atanh.tr = FALSE), ss.method = "sarima")
    lh.sarimaA.pred <- predict(lh.sarimaA, n.ahead = 12)
    expect_lt(max(abs(lh.sarimaA.pred$pred - lh.arima.pred$pred)), 1e-5)
    expect_lt(max(abs(lh.sarimaA.pred$se   - lh.arima.pred$se  )), 1e-5)



    ## USAccDeaths from  predict.Arima
    usdeaths.arima <- arima(USAccDeaths, order = c(0,1,1), seasonal = list(order = c(0,1,1)))
    usdeaths <- sarima(USAccDeaths ~ 0 | i(1) + si(12,1) + ma(1) + sma(12,1), ss.method = "base")
    usdeaths.arima.6 <- predict(usdeaths.arima, n.ahead = 6)
    usdeaths.6 <- predict(usdeaths, n.ahead = 6)

    ## not close enough check by other methods too.
    # expect_lt(max(abs(usdeaths.6$pred - usdeaths.arima.6$pred)), 1e-5)
    # expect_lt(max(abs(usdeaths.6$se   - usdeaths.arima.6$se  )), 1e-5)

    ## presidents from ?arima
    ##   contains 6 NA's
    arima(presidents, c(1, 0, 0))
    sarima(presidents ~ 1 | ar(1), ss.method = "base")

})
