library(VGAM)


### Name: plotvgam
### Title: Default VGAM Plotting
### Aliases: plotvgam plot.vgam
### Keywords: models regression smooth graphs

### ** Examples

coalminers <- transform(coalminers, Age = (age - 42) / 5)
fit <- vgam(cbind(nBnW, nBW, BnW, BW) ~ s(Age),
            binom2.or(zero = NULL), data = coalminers)
## Not run: 
##D  par(mfrow = c(1,3))
##D plot(fit, se = TRUE, ylim = c(-3, 2), las = 1)
##D plot(fit, se = TRUE, which.cf = 1:2, lcol = "blue", scol = "orange",
##D      ylim = c(-3, 2))
##D plot(fit, se = TRUE, which.cf = 1:2, lcol = "blue", scol = "orange",
##D      overlay = TRUE) 
## End(Not run)



