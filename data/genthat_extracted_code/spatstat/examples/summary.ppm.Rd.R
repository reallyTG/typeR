library(spatstat)


### Name: summary.ppm
### Title: Summarizing a Fitted Point Process Model
### Aliases: summary.ppm print.summary.ppm
### Keywords: spatial methods models

### ** Examples

  # invent some data
  X <- rpoispp(42)
  # fit a model to it
  fit <- ppm(X ~ x, Strauss(r=0.1))
  # summarize the fitted model
  summary(fit)
  # `quick' option
  summary(fit, quick=TRUE)
  # coefficients with standard errors and CI
  coef(summary(fit))
  coef(summary(fit, fine=TRUE))

  # save the full summary
  s <- summary(fit)
  # print it
  print(s)
  s
  # extract stuff
  names(s)
  coef(s)
  s$args$correction
  s$name
  s$trend$value

  ## Not run: 
##D   # multitype pattern
##D   data(demopat)
##D   fit <- ppm(demopat, ~marks, Poisson())
##D   summary(fit)
##D   
## End(Not run)

  # model with external covariates
  fitX <- ppm(X, ~Z, covariates=list(Z=function(x,y){x+y}))
  summary(fitX)



