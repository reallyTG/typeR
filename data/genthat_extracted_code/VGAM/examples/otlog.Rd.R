library(VGAM)


### Name: otlog
### Title: One-truncated Logarithmic Distribution
### Aliases: otlog
### Keywords: models regression

### ** Examples

odata <- data.frame(y1 = rotlog(n = 1000, shape = logit(1/3, inverse = TRUE)))
ofit <- vglm(y1 ~ 1, otlog, data = odata, trace = TRUE, crit = "c")
coef(ofit, matrix = TRUE)
Coef(ofit)
## Not run: 
##D with(odata,
##D     hist(y1, shape = TRUE, breaks = seq(0.5, max(y1) + 0.5, by = 1),
##D          border = "blue"))
##D x <- seq(1, with(odata, max(y1)), by = 1)
##D with(odata, lines(x, dotlog(x, Coef(ofit)[1]), col = "orange", type = "h", lwd = 2)) 
## End(Not run)



