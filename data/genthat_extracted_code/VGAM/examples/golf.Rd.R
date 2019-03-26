library(VGAM)


### Name: golf
### Title: Gamma-Ordinal Link Function
### Aliases: golf
### Keywords: math models regression

### ** Examples

## Not run: 
##D golf("p", lambda = 1, short = FALSE)
##D golf("p", lambda = 1, tag = TRUE)
##D 
##D p <- seq(0.02, 0.98, len = 201)
##D y <- golf(p, lambda = 1)
##D y. <- golf(p, lambda = 1, deriv = 1, inverse = TRUE)
##D max(abs(golf(y, lambda = 1, inverse = TRUE) - p))  # Should be 0
##D 
##D #\ dontrun{par(mfrow = c(2, 1), las = 1)
##D #plot(p, y, type = "l", col = "blue", main = "golf()")
##D #abline(h = 0, v = 0.5, col = "orange", lty = "dashed")
##D #plot(p, y., type = "l", col = "blue",
##D #     main = "(Reciprocal of) first GOLF derivative")
##D #}
##D 
##D # Another example
##D gdata <- data.frame(x2 = sort(runif(nn <- 1000)))
##D gdata <- transform(gdata, x3 = runif(nn))
##D gdata <- transform(gdata, mymu = exp( 3 + 1 * x2 - 2 * x3))
##D lambda <- 4
##D gdata <- transform(gdata,
##D          y1 = rgamma(nn, shape = lambda, scale = mymu / lambda))
##D cutpoints <- c(-Inf, 10, 20, Inf)
##D gdata <- transform(gdata, cuty = Cut(y1, breaks = cutpoints))
##D 
##D #\ dontrun{ par(mfrow = c(1, 1), las = 1)
##D #with(gdata, plot(x2, x3, col = cuty, pch = as.character(cuty))) }
##D with(gdata, table(cuty) / sum(table(cuty)))
##D fit <- vglm(cuty ~ x2 + x3, cumulative(multiple.responses = TRUE,
##D            reverse = TRUE, parallel = FALSE ~ -1,
##D            link = golf(cutpoint = cutpoints[2:3], lambda = lambda)),
##D            data = gdata, trace = TRUE)
##D head(depvar(fit))
##D head(fitted(fit))
##D head(predict(fit))
##D coef(fit)
##D coef(fit, matrix = TRUE)
##D constraints(fit)
##D fit@misc
## End(Not run)



