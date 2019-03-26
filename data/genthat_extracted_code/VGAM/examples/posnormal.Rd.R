library(VGAM)


### Name: posnormal
### Title: Positive Normal Distribution Family Function
### Aliases: posnormal
### Keywords: models regression

### ** Examples

pdata <- data.frame(Mean = 1.0, SD = exp(1.0))
pdata <- transform(pdata, y = rposnorm(n <- 1000, m = Mean, sd = SD))

## Not run: 
##D with(pdata, hist(y, prob = TRUE, border = "blue",
##D   main = paste("posnorm(m =", Mean[1], ", sd =", round(SD[1], 2),")"))) 
## End(Not run)
fit <- vglm(y ~ 1, posnormal, data = pdata, trace = TRUE)
coef(fit, matrix = TRUE)
(Cfit <- Coef(fit))
mygrid <- with(pdata, seq(min(y), max(y), len = 200))  # Add the fit to the histogram
## Not run: lines(mygrid, dposnorm(mygrid, Cfit[1], Cfit[2]), col = "orange")



