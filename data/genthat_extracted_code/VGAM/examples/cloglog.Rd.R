library(VGAM)


### Name: cloglog
### Title: Complementary Log-log Link Function
### Aliases: cloglog
### Keywords: math models regression

### ** Examples

p <- seq(0.01, 0.99, by = 0.01)
cloglog(p)
max(abs(cloglog(cloglog(p), inverse = TRUE) - p))  # Should be 0

p <- c(seq(-0.02, 0.02, by = 0.01), seq(0.97, 1.02, by = 0.01))
cloglog(p)  # Has NAs
cloglog(p, bvalue = .Machine$double.eps)  # Has no NAs

## Not run: 
##D p <- seq(0.01, 0.99, by = 0.01)
##D plot(p, logit(p), type = "l", col = "limegreen", lwd = 2, las = 1,
##D      main = "Some probability link functions", ylab = "transformation")
##D lines(p, probit(p), col = "purple", lwd = 2)
##D lines(p, cloglog(p), col = "chocolate", lwd = 2)
##D lines(p, cauchit(p), col = "tan", lwd = 2)
##D abline(v = 0.5, h = 0, lty = "dashed")
##D legend(0.1, 4, c("logit", "probit", "cloglog", "cauchit"),
##D        col = c("limegreen", "purple", "chocolate", "tan"), lwd = 2)
## End(Not run)

## Not run: 
##D # This example shows that a cloglog link is preferred over the logit
##D n <- 500; p <- 5; S <- 3; Rank <- 1  # Species packing model:
##D mydata <- rcqo(n, p, S, eq.tol = TRUE, es.opt = TRUE, eq.max = TRUE,
##D                family = "binomial", hi.abundance = 5, seed = 123,
##D                Rank = Rank)
##D fitc <- cqo(attr(mydata, "formula"), I.tol = TRUE, data = mydata,
##D             fam = binomialff(multiple.responses = TRUE, link = "cloglog"),
##D             Rank = Rank)
##D fitl <- cqo(attr(mydata, "formula"), I.tol = TRUE, data = mydata,
##D             fam = binomialff(multiple.responses = TRUE, link = "logit"),
##D             Rank = Rank)
##D 
##D # Compare the fitted models (cols 1 and 3) with the truth (col 2)
##D cbind(concoef(fitc), attr(mydata, "concoefficients"), concoef(fitl))
## End(Not run)



