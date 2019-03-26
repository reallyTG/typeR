library(VGAM)


### Name: venice
### Title: Venice Maximum Sea Levels Data
### Aliases: venice venice90
### Keywords: datasets

### ** Examples

## Not run: 
##D matplot(venice[["year"]], venice[, -1], xlab = "Year",
##D         ylab = "Sea level (cm)", type = "l")
##D 
##D ymat <- as.matrix(venice[, paste("r", 1:10, sep = "")])
##D fit1 <- vgam(ymat ~ s(year, df = 3), gumbel(R = 365, mpv = TRUE),
##D              data = venice, trace = TRUE, na.action = na.pass)
##D head(fitted(fit1))
##D 
##D par(mfrow = c(2, 1), xpd = TRUE)
##D plot(fit1, se = TRUE, lcol = "blue", llwd = 2, slty = "dashed")
##D 
##D par(mfrow = c(1,1), bty = "l", xpd = TRUE, las = 1)
##D qtplot(fit1, mpv = TRUE, lcol = c(1, 2, 5), tcol = c(1, 2, 5),
##D        llwd = 2, pcol = "blue", tadj = 0.1)
##D 
##D plot(sealevel ~ Year, data = venice90, type = "h", col = "blue")
##D summary(venice90)
##D dim(venice90)
##D round(100 * nrow(venice90) / ((2009 - 1940 + 1) * 365.26 * 24), digits = 3)
## End(Not run)



