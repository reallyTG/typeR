library(VGAM)


### Name: polf
### Title: Poisson-Ordinal Link Function
### Aliases: polf
### Keywords: math models regression

### ** Examples

## Not run: 
##D polf("p", cutpoint = 2, short = FALSE)
##D polf("p", cutpoint = 2, tag = TRUE)
##D 
##D p <- seq(0.01, 0.99, by = 0.01)
##D y <- polf(p, cutpoint = 2)
##D y. <- polf(p, cutpoint = 2, deriv = 1)
##D max(abs(polf(y, cutpoint = 2, inv = TRUE) - p))  # Should be 0
##D 
##D #\ dontrun{ par(mfrow = c(2, 1), las = 1)
##D #plot(p, y, type = "l", col = "blue", main = "polf()")
##D #abline(h = 0, v = 0.5, col = "orange", lty = "dashed")
##D #
##D #plot(p, y., type = "l", col = "blue",
##D #     main = "(Reciprocal of) first POLF derivative")
##D #}
##D 
##D 
##D # Rutherford and Geiger data
##D ruge <- data.frame(yy = rep(0:14,
##D       times = c(57,203,383,525,532,408,273,139,45,27,10,4,0,1,1)))
##D with(ruge, length(yy))  # 2608 1/8-minute intervals
##D cutpoint <- 5
##D ruge <- transform(ruge, yy01 = ifelse(yy <= cutpoint, 0, 1))
##D fit <- vglm(yy01 ~ 1, binomialff(link = polf(cutpoint = cutpoint)), ruge)
##D coef(fit, matrix = TRUE)
##D exp(coef(fit))
##D 
##D 
##D # Another example
##D pdata <- data.frame(x2 = sort(runif(nn <- 1000)))
##D pdata <- transform(pdata, x3 = runif(nn))
##D pdata <- transform(pdata, mymu = exp( 3 + 1 * x2 - 2 * x3))
##D pdata <- transform(pdata, y1 = rpois(nn, lambda = mymu))
##D cutpoints <- c(-Inf, 10, 20, Inf)
##D pdata <- transform(pdata, cuty = Cut(y1, breaks = cutpoints))
##D #\ dontrun{ with(pdata, plot(x2, x3, col = cuty, pch = as.character(cuty))) }
##D with(pdata, table(cuty) / sum(table(cuty)))
##D fit <- vglm(cuty ~ x2 + x3, data = pdata, trace = TRUE,
##D             cumulative(reverse = TRUE,
##D                        parallel = TRUE,
##D                        link = polf(cutpoint = cutpoints[2:3]),
##D                        multiple.responses = TRUE))
##D head(depvar(fit))
##D head(fitted(fit))
##D head(predict(fit))
##D coef(fit)
##D coef(fit, matrix = TRUE)
##D constraints(fit)
##D fit@misc$earg
## End(Not run)



