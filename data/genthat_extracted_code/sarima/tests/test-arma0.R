library(sarima)
context("Fitting ARMA0 models - mainly for experiments")

test_that("arma0 works ok", {
    ## these functions are mainly for quick experiments

    expect_true(TRUE)
    ## An example from KFAS:
    set.seed(1)
    y <- arima.sim(n = 1000, list(ar = c(0.8897, -0.4858), ma = c(-0.2279, 0.2488)),
                   innov = rnorm(1000) * sqrt(0.5))

    arma0a_desc <- makeArma0SSModel(ar = c(0, 0), ma = c(0, 0), Q = 1, H = 0, y = y)

    arma0_fit <- optim(par = c(rep(0, 4), log(1)), fn = arma0a_desc$updateFun,
                       method = "BFGS", model = arma0a_desc$model, hessian = TRUE)
    arma0_fit$hessian

    arma0_fittedModel <- fitArma0Model(arma0a_desc)
    arma0_fittedModel

    arma0_fittedModel$par
    arma0_fittedModel$se

    arma0_fittedModel$T
    arma0_fittedModel$R
    arma0_fittedModel$Q
    -logLik(arma0_fittedModel$SSModel)
})
