library(gamboostLSS)


### Name: cvrisk.mboostLSS
### Title: Cross-Validation
### Aliases: cvrisk cvrisk.mboostLSS cvrisk.nc_mboostLSS make.grid
###   plot.cvriskLSS plot.nc_cvriskLSS
### Keywords: models regression

### ** Examples

## Data generating process:
set.seed(1907)
x1 <- rnorm(1000)
x2 <- rnorm(1000)
x3 <- rnorm(1000)
x4 <- rnorm(1000)
x5 <- rnorm(1000)
x6 <- rnorm(1000)
mu    <- exp(1.5 +1 * x1 +0.5 * x2 -0.5 * x3 -1 * x4)
sigma <- exp(-0.4 * x3 -0.2 * x4 +0.2 * x5 +0.4 * x6)
y <- numeric(1000)
for( i in 1:1000)
    y[i] <- rnbinom(1, size = sigma[i], mu = mu[i])
dat <- data.frame(x1, x2, x3, x4, x5, x6, y)

## linear model with y ~ . for both components: 100 boosting iterations
model <- glmboostLSS(y ~ ., families = NBinomialLSS(), data = dat,
                     control = boost_control(mstop = 100),
                     center = TRUE)

## set up a grid
grid <-  make.grid(mstop(model), length.out = 5, dense_mu_grid = FALSE)
plot(grid)

## No test: 
### Do not test the following code per default on CRAN as it takes some time to run:
### a tiny toy example (5-fold bootsrap with maximum stopping value 100)
## (to run it on multiple cores of a Linux or Mac OS computer remove
##  set papply = mclapply (default) and set mc.nodes to the
##  appropriate number of nodes)
cvr <- cvrisk(model, folds = cv(model.weights(model), B = 5),
              papply = lapply, grid = grid)
cvr
## plot the results
par(mfrow = c(1, 2))
plot(cvr)
plot(cvr, type = "lines")
## extract optimal mstop (here: grid to small)
mstop(cvr)
### END (don't test automatically)
## End(No test)

## No test: 
### Do not test the following code per default on CRAN as it takes some time to run:
### a more realistic example
grid <- make.grid(c(mu = 400, sigma = 400), dense_mu_grid = FALSE)
plot(grid)
cvr <- cvrisk(model, grid = grid)
mstop(cvr)
## set model to optimal values:
mstop(model) <- mstop(cvr)
### END (don't test automatically)
## End(No test)

### Other grids:
plot(make.grid(mstop(model), length.out = 3, dense_mu_grid = FALSE))
plot(make.grid(c(mu = 400, sigma = 400), log = FALSE, dense_mu_grid = FALSE))
plot(make.grid(c(mu = 400, sigma = 400), length.out = 4,
               min = 100, log = FALSE, dense_mu_grid = FALSE))


### Now use dense mu grids
# standard grid
plot(make.grid(c(mu = 100, sigma = 100), dense = FALSE),
     pch = 20, col = "red")
# dense grid for all mstop_mu values greater than mstop_sigma
grid <- make.grid(c(mu = 100, sigma = 100))
points(grid, pch = 20, cex = 0.2)
abline(0,1)

# now with three parameters
grid <- make.grid(c(mu = 100, sigma = 100, df = 30),
                  length.out = c(5, 5, 2), dense = FALSE)
densegrid <- make.grid(c(mu = 100, sigma = 100, df = 30),
                       length.out = c(5, 5, 2))
par(mfrow = c(1,2))
# first for df = 1
plot(grid[grid$df == 1, 1:2], main = "df = 1", pch = 20, col = "red")
abline(0,1)
abline(v = 1)
# now expand grid for all mu values greater the corresponding sigma
# value (i.e. below the bisecting line) and above df (i.e. 1)
points(densegrid[densegrid$df == 1, 1:2], pch = 20, cex = 0.2)

# now for df = 30
plot(grid[grid$df == 30, 1:2], main = "df = 30", pch = 20, col = "red")
abline(0,1)
abline(v = 30)
# now expand grid for all mu values greater the corresponding sigma
# value (i.e. below the bisecting line) and above df (i.e. 30)
points(densegrid[densegrid$df == 30, 1:2], pch = 20, cex = 0.2)



