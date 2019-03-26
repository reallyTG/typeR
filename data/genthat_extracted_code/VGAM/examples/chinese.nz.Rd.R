library(VGAM)


### Name: chinese.nz
### Title: Chinese Population in New Zealand 1867-2001 Data
### Aliases: chinese.nz
### Keywords: datasets

### ** Examples

## Not run: 
##D  par(mfrow = c(1, 2))
##D plot(female / (male + female) ~ year, chinese.nz, type = "b",
##D      ylab = "Proportion", col = "blue", las = 1,
##D      cex = 0.015 * sqrt(male + female),
##D #    cex = 0.10 * sqrt((male + female)^1.5 / sqrt(female) / sqrt(male)),
##D      main = "Proportion of NZ Chinese that are female")
##D abline(h = 0.5, lty = "dashed", col = "gray")
##D 
##D fit1.cnz <- vglm(cbind(female, male) ~ year,             binomialff,
##D                  data = chinese.nz)
##D fit2.cnz <- vglm(cbind(female, male) ~ sm.poly(year, 2), binomialff,
##D                  data = chinese.nz)
##D fit4.cnz <- vglm(cbind(female, male) ~   sm.bs(year, 5), binomialff,
##D                  data = chinese.nz)
##D 
##D lines(fitted(fit1.cnz) ~ year, chinese.nz, col = "purple", lty = 1)
##D lines(fitted(fit2.cnz) ~ year, chinese.nz, col = "green", lty = 2)
##D lines(fitted(fit4.cnz) ~ year, chinese.nz, col = "orange", lwd = 2, lty = 1)
##D legend("bottomright", col = c("purple", "green", "orange"),
##D        lty = c(1, 2, 1), leg = c("linear", "quadratic", "B-spline"))
##D 
##D plot(100*(male+female)/nz ~ year, chinese.nz, type = "b", ylab = "Percent",
##D      ylim = c(0, max(100*(male+female)/nz)), col = "blue", las = 1,
##D      main = "Percent of NZers that are Chinese")
##D abline(h = 0, lty = "dashed", col = "gray") 
## End(Not run)



