library(simex)


### Name: mcsimex
### Title: Misclassification in models using MCSIMEX
### Aliases: mcsimex print.mcsimex summary.mcsimex print.summary.mcsimex
###   plot.mcsimex predict.mcsimex refit.mcsimex plot.mcsimex
###   predict.mcsimex print.mcsimex print.summary.mcsimex summary.mcsimex
###   refit.mcsimex
### Keywords: models

### ** Examples

x <- rnorm(200, 0, 1.142)
z <- rnorm(200, 0, 2)
y <- factor(rbinom(200, 1, (1 / (1 + exp(-1 * (-2 + 1.5 * x -0.5 * z))))))
Pi <- matrix(data = c(0.9, 0.1, 0.3, 0.7), nrow = 2, byrow = FALSE)
dimnames(Pi) <- list(levels(y), levels(y))
ystar <- misclass(data.frame(y), list(y = Pi), k = 1)[, 1]
naive.model <- glm(ystar ~ x + z, family = binomial, x = TRUE, y = TRUE)
true.model  <- glm(y ~ x + z, family = binomial)
simex.model <- mcsimex(naive.model, mc.matrix = Pi, SIMEXvariable = "ystar")

op <- par(mfrow = c(2, 3))
invisible(lapply(simex.model$theta, boxplot, notch = TRUE, outline = FALSE,
                 names = c(0.5, 1, 1.5, 2)))
                 plot(simex.model)
simex.model2 <- refit(simex.model, "line")
plot(simex.model2)
par(op)

# example using polr from the MASS package
## Not run: 
##D if(require(MASS)) {
##D   yord <- cut((1 / (1 + exp(-1 * (-2 + 1.5 * x -0.5 * z)))), 3, ordered=TRUE)
##D   Pi3 <- matrix(data = c(0.8, 0.1, 0.1, 0.2, 0.7, 0.1, 0.1, 0.2, 0.7), nrow = 3, byrow = FALSE)
##D   dimnames(Pi3) <- list(levels(yord), levels(yord))
##D   ystarord <- misclass(data.frame(yord), list(yord = Pi3), k = 1)[, 1]
##D   naive.ord.model <- polr(ystarord ~ x + z, Hess = TRUE)
##D   simex.ord.model <- mcsimex(naive.ord.model, mc.matrix = Pi3,
##D       SIMEXvariable = "ystarord", asymptotic=FALSE)
##D }
## End(Not run)

# example for a function which can be supplied to the function mcsimex()
# "ystar" is the variable which is to be misclassified
# using the example above
## Not run: 
##D my.misclass <- function (datas, k) {
##D     ystar <- datas$"ystar"
##D     p1 <- matrix(data = c(0.75, 0.25, 0.25, 0.75), nrow = 2, byrow = FALSE)
##D     colnames(p1) <- levels(ystar)
##D     rownames(p1) <- levels(ystar)
##D     p0 <- matrix(data = c(0.8, 0.2, 0.2, 0.8), nrow = 2, byrow = FALSE)
##D 
##D     colnames(p0) <- levels(ystar)
##D     rownames(p0) <- levels(ystar)
##D     ystar[datas$x < 0] <-
##D     misclass(data.frame(ystar = ystar[datas$x < 0]), list(ystar = p1), k = k)[, 1]
##D     ystar[datas$x > 0] <-
##D     misclass(data.frame(ystar = ystar[datas$x > 0]), list(ystar = p0), k = k)[, 1]
##D     ystar <- factor(ystar)
##D     return(data.frame(ystar))}
##D 
##D simex.model.differential <- mcsimex(naive.model, mc.matrix = "my.misclass", SIMEXvariable = "ystar")
## End(Not run)




