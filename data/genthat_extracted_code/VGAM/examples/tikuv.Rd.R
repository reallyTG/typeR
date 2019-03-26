library(VGAM)


### Name: tikuv
### Title: Short-tailed Symmetric Distribution Family Function
### Aliases: tikuv
### Keywords: models regression

### ** Examples

m <- 1.0; sigma <- exp(0.5)
tdata <- data.frame(y = rtikuv(n = 1000, d = 1, m = m, s = sigma))
tdata <- transform(tdata, sy = sort(y))
fit <- vglm(y ~ 1, tikuv(d = 1), data = tdata, trace = TRUE)
coef(fit, matrix = TRUE)
(Cfit <- Coef(fit))
with(tdata, mean(y))
## Not run: 
##D  with(tdata, hist(y, prob = TRUE))
##D lines(dtikuv(sy, d = 1, m = Cfit[1], s = Cfit[2]) ~ sy, data = tdata, col = "orange") 
## End(Not run)



