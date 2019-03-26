library(VGAM)


### Name: otpospoisson
### Title: One-truncated Poisson Distribution
### Aliases: otpospoisson
### Keywords: models regression

### ** Examples

odata <- data.frame(y1 = rotpospois(n = 1000, lambda = loge(1, inverse = TRUE)))
ofit <- vglm(y1 ~ 1, otpospoisson, data = odata, trace = TRUE, crit = "c")
coef(ofit, matrix = TRUE)
Coef(ofit)
## Not run: 
##D with(odata,
##D     hist(y1, prob = TRUE, breaks = seq(0.5, max(y1) + 0.5, by = 1),
##D          border = "blue"))
##D x <- seq(1, with(odata, max(y1)), by = 1)
##D with(odata, lines(x, dotpospois(x, Coef(ofit)[1]), col = "orange", type = "h", lwd = 2)) 
## End(Not run)



