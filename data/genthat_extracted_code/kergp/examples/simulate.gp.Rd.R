library(kergp)


### Name: simulate.gp
### Title: Simulation of Paths from a 'gp' Object
### Aliases: simulate.gp

### ** Examples

set.seed(314159)
n <- 40
x <- sort(runif(n))
y <- 2 + 4 * x  + 2 * x^2 + 3 * sin(6 * pi * x ) + 1.0 * rnorm(n)
df <- data.frame(x = x, y = y)

##-------------------------------------------------------------------------
## use a Matern 3/2 covariance. With model #2, the trend is mispecified,
## so the smooth GP part of the model captures a part of the trend.
##-------------------------------------------------------------------------

myKern <- k1Matern3_2
inputNames(myKern) <- "x"
mygp <- list()
mygp[[1]] <- gp(formula = y ~ x + I(x^2) + sin(6 * pi * x), data = df, 
                parCovLower = c(0.01, 0.01), parCovUpper = c(10, 100),
                cov = myKern, estim = TRUE, noise = TRUE)
mygp[[2]] <- gp(formula = y ~ sin(6 * pi * x), data = df, 
                parCovLower = c(0.01, 0.01), parCovUpper = c(10, 100),
                cov = myKern, estim = TRUE, noise = TRUE)

##-------------------------------------------------------------------------
## New data
##-------------------------------------------------------------------------

nNew <- 150
xNew <- seq(from = -0.2, to= 1.2, length.out = nNew)
dfNew <- data.frame(x = xNew)

opar <- par(mfrow = c(2L, 2L))

nsim <- 40
for (i in 1:2) {

    ##--------------------------------------------------------------------
    ## beta known or not, conditional
    ##--------------------------------------------------------------------

    simTU <- simulate(object = mygp[[i]], newdata = dfNew,  nsim = nsim,
                      trendKnown = FALSE)
    plot(simTU, main = "trend unknown, conditional")

    simTK <- simulate(object = mygp[[i]], newdata = dfNew, nsim = nsim,
                      trendKnown = TRUE)
    plot(simTK, main = "trend known, conditional")

    ##--------------------------------------------------------------------
    ## The same but UNconditional
    ##--------------------------------------------------------------------

    simTU <- simulate(object = mygp[[i]], newdata = dfNew,  nsim = nsim,
                     trendKnown = FALSE, cond = FALSE)
    plot(simTU, main = "trend unknown, unconditional")
    simTK <- simulate(object = mygp[[i]], newdata = dfNew, nsim = nsim,
                      trendKnown = TRUE, cond = FALSE)
    plot(simTK, main = "trend known, unconditional")
}

par(opar)



