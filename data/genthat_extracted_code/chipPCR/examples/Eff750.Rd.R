library(chipPCR)


### Name: Eff750
### Title: Highly Replicate Number Amplification Curves
### Aliases: Eff750
### Keywords: datasets

### ** Examples

data(Eff750)

plot(NA, NA, xlim = c(1,40), ylim = c(0,max(Eff750)), xlab = "Cycle",
    ylab = "RFU", 
    main = "Amplification Curves with 75 Percent Efficiency")
apply(Eff750[, 1:ncol(Eff750)], 2, function(x) lines(1:40,x))

Fmean <- rowMeans(Eff750[, 1:ncol(Eff750)])
lines(1:40, Fmean, col = "red", lwd = 3)

legend(1, quantile(unlist(Eff750), 0.9), c("Raw", "Mean"), 
	pch = c(19,19), col = c(1,2))



