library(VGAM)


### Name: loglaplace
### Title: Log-Laplace and Logit-Laplace Distribution Family Functions
### Aliases: loglaplace1 logitlaplace1
### Keywords: models regression

### ** Examples

# Example 1: quantile regression of counts with regression splines
set.seed(123); my.k <- exp(0)
adata <- data.frame(x2 = sort(runif(n <- 500)))
mymu <- function(x) exp( 1 + 3*sin(2*x) / (x+0.5)^2)
adata <- transform(adata, y = rnbinom(n, mu = mymu(x2), size = my.k))
mytau <- c(0.1, 0.25, 0.5, 0.75, 0.9); mydof = 3
# halfstepping is usual:
fitp <- vglm(y ~ sm.bs(x2, df = mydof), data = adata, trace = TRUE,
            loglaplace1(tau = mytau, parallel.locat = TRUE))

## Not run: 
##D par(las = 1)  # Plot on a log1p() scale
##D mylwd <- 1.5
##D 
##D 
##D plot(jitter(log1p(y), factor = 1.5) ~ x2, adata, col = "red", pch = "o",
##D      main = "Example 1; darkgreen=truth, blue=estimated", cex = 0.75)
##D with(adata, matlines(x2, log1p(fitted(fitp)), col = "blue",
##D                       lty = 1, lwd = mylwd))
##D finexgrid <- seq(0, 1, len = 201)
##D for (ii in 1:length(mytau))
##D   lines(finexgrid, col = "darkgreen", lwd = mylwd,
##D         log1p(qnbinom(p = mytau[ii], mu = mymu(finexgrid), si = my.k)))
## End(Not run)
fitp@extra  # Contains useful information


# Example 2: sample proportions
set.seed(123); nnn <- 1000; ssize <- 100  # ssize = 1 will not work!
adata <- data.frame(x2 = sort(runif(nnn)))
mymu <- function(x) logit( 1.0 + 4*x, inv = TRUE)
adata <- transform(adata, ssize = ssize,
                    y2 = rbinom(nnn, size = ssize, prob = mymu(x2)) / ssize)

mytau <- c(0.25, 0.50, 0.75)
fit1 <- vglm(y2 ~ sm.bs(x2, df = 3), data = adata,
             weights = ssize, trace = TRUE,
             logitlaplace1(tau = mytau, lloc = "cloglog", paral = TRUE))

## Not run: 
##D # Check the solution.  Note: this may be like comparing apples with oranges.
##D plotvgam(fit1, se = TRUE, scol = "red", lcol = "blue",
##D          main = "Truth = 'darkgreen'")
##D # Centered approximately !
##D linkFunctionChar <- as.character(fit1@misc$link)
##D adata <- transform(adata, trueFunction=
##D                    theta2eta(theta = mymu(x2), link=linkFunctionChar))
##D with(adata, lines(x2, trueFunction - mean(trueFunction), col = "darkgreen"))
##D 
##D 
##D # Plot the data + fitted quantiles (on the original scale)
##D myylim <- with(adata, range(y2))
##D plot(y2 ~ x2, adata, col = "blue", ylim = myylim, las = 1,
##D      pch = ".", cex = 2.5)
##D with(adata, matplot(x2, fitted(fit1), add = TRUE, lwd = 3, type = "l"))
##D truecol <- rep(1:3, len = fit1@misc$M)  # Add the 'truth'
##D smallxgrid <- seq(0, 1, len = 501)
##D for (ii in 1:length(mytau))
##D   lines(smallxgrid, col = truecol[ii], lwd = 2,
##D         qbinom(p = mytau[ii], prob = mymu(smallxgrid), size = ssize) / ssize)
##D 
##D 
##D # Plot on the eta (== logit()/probit()/...) scale
##D with(adata, matplot(x2, predict(fit1), add = FALSE, lwd = 3, type = "l"))
##D # Add the 'truth'
##D for (ii in 1:length(mytau)) {
##D   true.quant <- qbinom(p = mytau[ii], pr = mymu(smallxgrid), si = ssize) / ssize
##D   lines(smallxgrid, theta2eta(theta = true.quant, link = linkFunctionChar),
##D         col = truecol[ii], lwd = 2)
##D }
## End(Not run)



