library(VGAM)


### Name: nbolf
### Title: Negative Binomial-Ordinal Link Function
### Aliases: nbolf
### Keywords: math models regression

### ** Examples

## Not run: 
##D nbolf("p", cutpoint = 2, k = 1, short = FALSE)
##D nbolf("p", cutpoint = 2, k = 1, tag = TRUE)
##D 
##D p <- seq(0.02, 0.98, by = 0.01)
##D y <- nbolf(p,cutpoint = 2, k = 1)
##D y. <- nbolf(p,cutpoint = 2, k = 1, deriv = 1)
##D max(abs(nbolf(y,cutpoint = 2, k = 1, inv = TRUE) - p))  # Should be 0
##D 
##D #\ dontrun{ par(mfrow = c(2, 1), las = 1)
##D #plot(p, y, type = "l", col = "blue", main = "nbolf()")
##D #abline(h = 0, v = 0.5, col = "red", lty = "dashed")
##D #
##D #plot(p, y., type = "l", col = "blue",
##D #     main = "(Reciprocal of) first NBOLF derivative") }
##D 
##D # Another example
##D nn <- 1000
##D x2 <- sort(runif(nn))
##D x3 <- runif(nn)
##D mymu <- exp( 3 + 1 * x2 - 2 * x3)
##D k <- 4
##D y1 <- rnbinom(nn, mu = mymu, size = k)
##D cutpoints <- c(-Inf, 10, 20, Inf)
##D cuty <- Cut(y1, breaks = cutpoints)
##D #\ dontrun{ plot(x2, x3, col = cuty, pch = as.character(cuty)) }
##D table(cuty) / sum(table(cuty))
##D fit <- vglm(cuty ~ x2 + x3, trace = TRUE,
##D             cumulative(reverse = TRUE, multiple.responses = TRUE,
##D                        parallel = TRUE,
##D                        link = nbolf(cutpoint = cutpoints[2:3], k = k)))
##D head(depvar(fit))
##D head(fitted(fit))
##D head(predict(fit))
##D coef(fit)
##D coef(fit, matrix = TRUE)
##D constraints(fit)
##D fit@misc
## End(Not run)



