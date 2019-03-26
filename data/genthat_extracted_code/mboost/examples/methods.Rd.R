library(mboost)


### Name: methods
### Title: Methods for Gradient Boosting Objects
### Aliases: mboost_methods print.glmboost print.mboost summary.mboost
###   coef.mboost coef.glmboost [.mboost AIC.mboost mstop mstop.gbAIC
###   mstop.mboost mstop.cvrisk mstop<- predict.mboost predict.gamboost
###   predict.blackboost predict.glmboost fitted.mboost residuals.mboost
###   resid.mboost variable.names.glmboost variable.names.mboost risk
###   risk.mboost extract extract.mboost extract.gamboost extract.glmboost
###   extract.blackboost extract.blg extract.bl_lin extract.bl_tree
###   logLik.mboost hatvalues.gamboost hatvalues.glmboost selected
###   selected.mboost nuisance nuisance.mboost downstream.test
### Keywords: methods

### ** Examples


  ### a simple two-dimensional example: cars data
  cars.gb <- glmboost(dist ~ speed, data = cars,
                      control = boost_control(mstop = 2000),
                      center = FALSE)
  cars.gb

  ### initial number of boosting iterations
  mstop(cars.gb)

  ### AIC criterion
  aic <- AIC(cars.gb, method = "corrected")
  aic

  ### extract coefficients for glmboost
  coef(cars.gb)
  coef(cars.gb, off2int = TRUE)        # offset added to intercept
  coef(lm(dist ~ speed, data = cars))  # directly comparable

  cars.gb_centered <- glmboost(dist ~ speed, data = cars,
                               center = TRUE)
  selected(cars.gb_centered)           # intercept never selected
  coef(cars.gb_centered)               # intercept implicitly estimated
                                       # and thus returned
  ## intercept is internally corrected for mean-centering
  - mean(cars$speed) * coef(cars.gb_centered, which="speed") # = intercept
  # not asked for intercept thus not returned
  coef(cars.gb_centered, which="speed")
  # explicitly asked for intercept
  coef(cars.gb_centered, which=c("Intercept", "speed"))

  ### enhance or restrict model
  cars.gb <- gamboost(dist ~ speed, data = cars,
                      control = boost_control(mstop = 100, trace = TRUE))
  cars.gb[10]
  cars.gb[100, return = FALSE] # no refitting required
  cars.gb[150, return = FALSE] # only iterations 101 to 150
                               # are newly fitted

  ### coefficients for optimal number of boosting iterations
  coef(cars.gb[mstop(aic)])
  plot(cars$dist, predict(cars.gb[mstop(aic)]),
       ylim = range(cars$dist))
  abline(a = 0, b = 1)

  ### example for extraction of coefficients
  set.seed(1907)
  n <- 100
  x1 <- rnorm(n)
  x2 <- rnorm(n)
  x3 <- rnorm(n)
  x4 <- rnorm(n)
  int <- rep(1, n)
  y <- 3 * x1^2 - 0.5 * x2 + rnorm(n, sd = 0.1)
  data <- data.frame(y = y, int = int, x1 = x1, x2 = x2, x3 = x3, x4 = x4)

  model <- gamboost(y ~ bols(int, intercept = FALSE) +
                        bbs(x1, center = TRUE, df = 1) +
                        bols(x1, intercept = FALSE) +
                        bols(x2, intercept = FALSE) +
                        bols(x3, intercept = FALSE) +
                        bols(x4, intercept = FALSE),
                    data = data, control = boost_control(mstop = 500))

  coef(model) # standard output (only selected base-learners)
  coef(model,
       which = 1:length(variable.names(model))) # all base-learners
  coef(model, which = "x1") # shows all base-learners for x1

  cf1 <- coef(model, which = c(1,3,4), aggregate = "cumsum")
  tmp <- sapply(cf1, function(x) x)
  matplot(tmp, type = "l", main = "Coefficient Paths")

  cf1_all <- coef(model, aggregate = "cumsum")
  cf1_all <- lapply(cf1_all, function(x) x[, ncol(x)]) # last element
  ## same as coef(model)

  cf2 <- coef(model, aggregate = "none")
  cf2 <- lapply(cf2, rowSums) # same as coef(model)

  ### example continued for extraction of predictions

  yhat <- predict(model) # standard prediction; here same as fitted(model)
  p1 <- predict(model, which = "x1") # marginal effects of x1
  orderX <- order(data$x1)
  ## rowSums needed as p1 is a matrix
  plot(data$x1[orderX], rowSums(p1)[orderX], type = "b")

  ## better: predictions on a equidistant grid
  new_data <- data.frame(x1 = seq(min(data$x1), max(data$x1), length = 100))
  p2 <- predict(model, newdata = new_data, which = "x1")
  lines(new_data$x1, rowSums(p2), col = "red")

  ### extraction of model characteristics
  extract(model, which = "x1")  # design matrices for x1
  extract(model, what = "penalty", which = "x1") # penalty matrices for x1
  extract(model, what = "lambda", which = "x1") # df and corresponding lambda for x1
       ## note that bols(x1, intercept = FALSE) is unpenalized

  extract(model, what = "bnames")  ## name of complete base-learner
  extract(model, what = "variable.names") ## only variable names
  variable.names(model)            ## the same

  ### extract from base-learners
  extract(bbs(x1), what = "design")
  extract(bbs(x1), what = "penalty")
  ## weights and lambda can only be extracted after using dpp
  weights <- rep(1, length(x1))
  extract(bbs(x1)$dpp(weights), what = "lambda")



