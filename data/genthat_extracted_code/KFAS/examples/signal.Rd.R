library(KFAS)


### Name: signal
### Title: Extracting the Partial Signal Of a State Space Model
### Aliases: signal

### ** Examples

model <- SSModel(log(drivers) ~ SSMtrend(1, NA) +
    SSMseasonal(12, sea.type = 'trigonometric', Q = NA) +
    log(PetrolPrice) + law,data = Seatbelts, H = NA)

ownupdatefn <- function(pars,model,...){
  model$H[] <- exp(pars[1])
  diag(model$Q[,,1]) <- exp(c(pars[2], rep(pars[3], 11)))
  model
}

fit <- fitSSM(inits = log(c(var(log(Seatbelts[,'drivers'])), 0.001, 0.0001)),
  model = model, updatefn = ownupdatefn, method = 'BFGS')

out <- KFS(fit$model, smoothing = c('state', 'mean'))
ts.plot(cbind(out$model$y, fitted(out)),lty = 1:2, col = 1:2,
  main = 'Observations and smoothed signal with and without seasonal component')
lines(signal(out, states = c('regression', 'trend'))$signal, col = 4, lty = 1)
legend('bottomleft',
  legend = c('Observations', 'Smoothed signal','Smoothed level'),
  col = c(1, 2, 4), lty = c(1, 2, 1))




