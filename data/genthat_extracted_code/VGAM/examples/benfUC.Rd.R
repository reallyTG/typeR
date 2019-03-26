library(VGAM)


### Name: Benford
### Title: Benford's Distribution
### Aliases: Benford dbenf pbenf qbenf rbenf
### Keywords: distribution

### ** Examples

dbenf(x <- c(0:10, NA, NaN, -Inf, Inf))
pbenf(x)

## Not run: 
##D xx <- 1:9
##D barplot(dbenf(xx), col = "lightblue", las = 1, xlab = "Leading digit",
##D         ylab = "Probability", names.arg = as.character(xx),
##D         main = paste("Benford's distribution",  sep = ""))
##D 
##D hist(rbenf(n = 1000), border = "blue", prob = TRUE,
##D      main = "1000 random variates from Benford's distribution",
##D      xlab = "Leading digit", sub="Red is the true probability",
##D      breaks = 0:9 + 0.5, ylim = c(0, 0.35), xlim = c(0, 10.0))
##D lines(xx, dbenf(xx), col = "red", type = "h")
##D points(xx, dbenf(xx), col = "red")
## End(Not run)



