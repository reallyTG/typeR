library(VGAM)


### Name: logff
### Title: Logarithmic Distribution
### Aliases: logff
### Keywords: models regression

### ** Examples

ldata <- data.frame(y = rlog(n = 1000, shape = logit(0.2, inverse = TRUE)))
fit <- vglm(y ~ 1, logff, data = ldata, trace = TRUE, crit = "c")
coef(fit, matrix = TRUE)
Coef(fit)
## Not run: 
##D with(ldata,
##D     hist(y, prob = TRUE, breaks = seq(0.5, max(y) + 0.5, by = 1),
##D          border = "blue"))
##D x <- seq(1, with(ldata, max(y)), by = 1)
##D with(ldata, lines(x, dlog(x, Coef(fit)[1]), col = "orange", type = "h", lwd = 2)) 
## End(Not run)


# Example: Corbet (1943) butterfly Malaya data
corbet <- data.frame(nindiv = 1:24,
                     ofreq = c(118, 74, 44, 24, 29, 22, 20, 19, 20, 15, 12,
                               14, 6, 12, 6, 9, 9, 6, 10, 10, 11, 5, 3, 3))
fit <- vglm(nindiv ~ 1, logff, data = corbet, weights = ofreq)
coef(fit, matrix = TRUE)
shapehat <- Coef(fit)["shape"]
pdf2 <- dlog(x = with(corbet, nindiv), shape = shapehat)
print(with(corbet, cbind(nindiv, ofreq, fitted = pdf2 * sum(ofreq))), digits = 1)



