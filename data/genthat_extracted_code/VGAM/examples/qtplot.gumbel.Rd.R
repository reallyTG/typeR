library(VGAM)


### Name: qtplot.gumbel
### Title: Quantile Plot for Gumbel Regression
### Aliases: qtplot.gumbel qtplot.gumbelff
### Keywords: graphs models regression

### ** Examples

ymat <- as.matrix(venice[, paste("r", 1:10, sep = "")])
fit1 <- vgam(ymat ~ s(year, df = 3), gumbel(R = 365, mpv = TRUE),
             data = venice, trace = TRUE, na.action = na.pass)
head(fitted(fit1))

## Not run: 
##D  par(mfrow = c(1, 1), bty = "l", xpd = TRUE, las = 1)
##D qtplot(fit1, mpv = TRUE, lcol = c(1, 2, 5), tcol = c(1, 2, 5),
##D        lwd = 2, pcol = "blue", tadj = 0.4, ylab = "Sea level (cm)")
##D 
##D qtplot(fit1, perc = 97, mpv = FALSE, lcol = 3, tcol = 3,
##D        lwd = 2, tadj = 0.4, add = TRUE) -> saved
##D head(saved@post$qtplot$fitted)
## End(Not run)



