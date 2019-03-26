library(KFAS)


### Name: logLik.SSModel
### Title: Log-likelihood of the State Space Model.
### Aliases: logLik.SSModel logLik

### ** Examples

# Example of estimating AR model with covariates, and how to deal with possible
# non-stationarity in optimization.

set.seed(1)
x <- rnorm(100)
y <- 2 * x + arima.sim(n = 100, model = list(ar = c(0.5, -0.3)))

model<- SSModel(y ~ SSMarima(ar = c(0.5, -0.3),  Q = 1) + x, H = 0)

obj <- function(pars, model, estimate = TRUE) {
  #guard against stationarity
  armamod <- try(SSMarima(ar = artransform(pars[1:2]), Q = exp(pars[3])), silent = TRUE)
  if(class(armamod) == "try-error") {
    return(Inf)
  } else {
    # use advanced subsetting method for SSModels, see ?`[.SSModel`
    model["T", states = "arima"] <- armamod$T
    model["Q", eta = "arima"]  <- armamod$Q
    model["P1", states = "arima"]  <- armamod$P1
    if(estimate) {
      -logLik(model)
    } else {
      model
    }
  }
}
fit <- optim(p = c(0.5,-0.5,1), fn = obj, model = model, method ="BFGS")

model <- obj(fit$par, model, FALSE)
model$T
model$Q
coef(KFS(model), last = TRUE)




