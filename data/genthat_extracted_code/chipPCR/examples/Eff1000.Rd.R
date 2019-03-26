library(chipPCR)


### Name: Eff1000
### Title: Highly Replicate Number Amplification Curves
### Aliases: Eff1000
### Keywords: datasets

### ** Examples

data(Eff1000)

plot(NA, NA, xlim = c(1,40), ylim = c(0,max(Eff1000)), xlab = "Cycle",
    ylab = "RFU", 
    main = "Amplification Curves with 100 Percent Efficiency")
apply(Eff1000[, 1:ncol(Eff1000)], 2, function(x) lines(1:40,x))

Fmean <- rowMeans(Eff1000[, 1:ncol(Eff1000)])
lines(1:40, Fmean, col = "red", lwd = 3)

legend(1, quantile(unlist(Eff1000), 0.9), c("Raw", "Mean"), 
	pch = c(19,19), col = c(1,2))



