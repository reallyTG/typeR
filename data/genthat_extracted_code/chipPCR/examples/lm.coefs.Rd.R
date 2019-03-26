library(chipPCR)


### Name: lm.coefs
### Title: Compute linear model coefficients
### Aliases: lm.coefs
### Keywords: models robust regression MM-estimator quantile

### ** Examples

plot(VIMCFX96_69[, 1], VIMCFX96_69[, 2], type = "l", xlab = "Cycle", 
     ylab = "Fluorescence")
rect(1,0,10,5000)
method <- c("lmrob", "rq", "least", "rfit")
for (i in 1:4) {
  tmp <- lm.coefs(VIMCFX96_69[1:10, 1], VIMCFX96_69[1:10, 2], 
		  method.reg = method[i])
  abline(a = tmp[1, 1], b = tmp[2, 1], col = i + 1, lwd = 1.5)
}
legend(2, 3000, c("Data", "lmrob", "rq", "least", "rfit"), lty = 1, col = 1:5, 
       cex = 1.5)



