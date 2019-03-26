library(VGAM)


### Name: plotvglm
### Title: Plots for VGLMs
### Aliases: plotvglm
### Keywords: models regression smooth graphs

### ** Examples

## Not run: 
##D ndata <- data.frame(x2 = runif(nn <- 200))
##D ndata <- transform(ndata, y1 = rnbinom(nn, mu = exp(3+x2), size = exp(1)))
##D fit1 <- vglm(y1 ~ x2, negbinomial, data = ndata, trace = TRUE)
##D coef(fit1, matrix = TRUE)
##D par(mfrow = c(2, 2))
##D plot(fit1)
##D 
##D # Manually produce the four plots
##D plot(fit1, which = 1, col = "blue", las = 1, main = "main1")
##D abline(h = 0, lty = "dashed", col = "gray50")
##D plot(fit1, which = 2, col = "blue", las = 1, main = "main2")
##D abline(h = 0, lty = "dashed", col = "gray50")
##D plot(fit1, which = 3, col = "blue", las = 1, main = "main3")
##D plot(fit1, which = 4, col = "blue", las = 1, main = "main4")
## End(Not run)



