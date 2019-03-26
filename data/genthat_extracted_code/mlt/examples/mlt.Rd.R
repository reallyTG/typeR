library(mlt)


### Name: mlt
### Title: Most Likely Transformations
### Aliases: mlt

### ** Examples

 
  ### set-up conditional transformation model for conditional
  ### distribution of dist given speed
  dist <- numeric_var("dist", support = c(2.0, 100), bounds = c(0, Inf))
  speed <- numeric_var("speed", support = c(5.0, 23), bounds = c(0, Inf)) 
  ctmm <- ctm(response = Bernstein_basis(dist, order = 4, ui = "increasing"),
              interacting = Bernstein_basis(speed, order = 3))

  ### fit model
  (mltm <- mlt(ctmm, data = cars))

  ### plot data
  plot(cars)
  ### predict quantiles and overlay data with model via a "quantile sheet"
  q <- predict(mltm, newdata = data.frame(speed = 0:24), type = "quantile", 
               p = 2:8 / 10, K = 500)
  tmp <- apply(q, 1, function(x) lines(0:24, x, type = "l"))




