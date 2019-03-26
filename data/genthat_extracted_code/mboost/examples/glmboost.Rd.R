library(mboost)


### Name: glmboost
### Title: Gradient Boosting with Component-wise Linear Models
### Aliases: glmboost glmboost.formula glmboost.matrix glmboost.default
### Keywords: models regression

### ** Examples


    ### a simple two-dimensional example: cars data
    cars.gb <- glmboost(dist ~ speed, data = cars,
                        control = boost_control(mstop = 2000),
                        center = FALSE)
    cars.gb

    ### coefficients should coincide
    cf <- coef(cars.gb, off2int = TRUE)     ## add offset to intercept
    coef(cars.gb) + c(cars.gb$offset, 0)    ## add offset to intercept (by hand)
    signif(cf, 3)
    signif(coef(lm(dist ~ speed, data = cars)), 3)
    ## almost converged. With higher mstop the results get even better

    ### now we center the design matrix for
    ### much quicker "convergence"
    cars.gb_centered <- glmboost(dist ~ speed, data = cars,
                                 control = boost_control(mstop = 2000),
                                 center = TRUE)

    ## plot coefficient paths of glmboost
    par(mfrow=c(1,2), mai = par("mai") * c(1, 1, 1, 2.5))
    plot(cars.gb, main = "without centering")
    plot(cars.gb_centered, main = "with centering")

    ### alternative loss function: absolute loss
    cars.gbl <- glmboost(dist ~ speed, data = cars,
                         control = boost_control(mstop = 1000),
                         family = Laplace())
    cars.gbl
    coef(cars.gbl, off2int = TRUE)

    ### plot fit
    par(mfrow = c(1,1))
    plot(dist ~ speed, data = cars)
    lines(cars$speed, predict(cars.gb), col = "red")     ## quadratic loss
    lines(cars$speed, predict(cars.gbl), col = "green")  ## absolute loss

    ### Huber loss with adaptive choice of delta
    cars.gbh <- glmboost(dist ~ speed, data = cars,
                         control = boost_control(mstop = 1000),
                         family = Huber())

    lines(cars$speed, predict(cars.gbh), col = "blue")   ## Huber loss
    legend("topleft", col = c("red", "green", "blue"), lty = 1,
           legend = c("Gaussian", "Laplace", "Huber"), bty = "n")

    ### sparse high-dimensional example that makes use of the matrix
    ### interface of glmboost and uses the matrix representation from
    ### package Matrix
    library("Matrix")
    n <- 100
    p <- 10000
    ptrue <- 10
    X <- Matrix(0, nrow = n, ncol = p)
    X[sample(1:(n * p), floor(n * p / 20))] <- runif(floor(n * p / 20))
    beta <- numeric(p)
    beta[sample(1:p, ptrue)] <- 10
    y <- drop(X %*% beta + rnorm(n, sd = 0.1))
    mod <- glmboost(y = y, x = X, center = TRUE) ### mstop needs tuning
    coef(mod, which = which(beta > 0))




