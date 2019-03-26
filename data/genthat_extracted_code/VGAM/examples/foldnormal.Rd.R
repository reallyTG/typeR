library(VGAM)


### Name: foldnormal
### Title: Folded Normal Distribution Family Function
### Aliases: foldnormal
### Keywords: models regression

### ** Examples

## Not run: 
##D  m <-  2; SD <- exp(1)
##D fdata <- data.frame(y = rfoldnorm(n <- 1000, m = m, sd = SD))
##D hist(with(fdata, y), prob = TRUE, main = paste("foldnormal(m = ", m,
##D      ", sd = ", round(SD, 2), ")"))
##D fit <- vglm(y ~ 1, foldnormal, data = fdata, trace = TRUE)
##D coef(fit, matrix = TRUE)
##D (Cfit <- Coef(fit))
##D # Add the fit to the histogram:
##D mygrid <- with(fdata, seq(min(y), max(y), len = 200))
##D lines(mygrid, dfoldnorm(mygrid, Cfit[1], Cfit[2]), col = "orange")
## End(Not run)



