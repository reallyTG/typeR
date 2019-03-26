library(VGAM)


### Name: sc.studentt2
### Title: Scaled Student t Distribution with 2 df Family Function
### Aliases: sc.studentt2
### Keywords: models regression

### ** Examples

set.seed(123); nn <- 1000
kdata <- data.frame(x2 = sort(runif(nn)))
kdata <- transform(kdata, mylocat = 1 + 3 * x2,
                          myscale = 1)
kdata <- transform(kdata, y = rsc.t2(nn, loc = mylocat, scale = myscale))
fit  <- vglm(y ~ x2, sc.studentt2(perc = c(1, 50, 99)), data = kdata)
fit2 <- vglm(y ~ x2,    studentt2(df = 2), data = kdata)  # 'same' as fit

coef(fit, matrix = TRUE)
head(fitted(fit))
head(predict(fit))

# Nice plot of the results
## Not run: 
##D  plot(y ~ x2, data = kdata, col = "blue", las = 1,
##D      sub  = paste("n =", nn),
##D      main = "Fitted quantiles/expectiles using the sc.studentt2() distribution")
##D matplot(with(kdata, x2), fitted(fit), add = TRUE, type = "l", lwd = 3)
##D legend("bottomright", lty = 1:3, lwd = 3, legend = colnames(fitted(fit)),
##D        col = 1:3) 
## End(Not run)

fit@extra$percentile  # Sample quantiles



