library(chipPCR)


### Name: Eff875
### Title: Highly Replicate Number Amplification Curves
### Aliases: Eff875
### Keywords: datasets

### ** Examples

data(Eff875)

plot(NA, NA, xlim = c(1,40), ylim = c(0,max(Eff875)), xlab = "Cycle",
    ylab = "RFU", 
    main = "Amplification Curves with 87.5 Percent Efficiency")
apply(Eff875[, 1:ncol(Eff875)], 2, function(x) lines(1:40,x))

Fmean <- rowMeans(Eff875[, 1:ncol(Eff875)])
lines(1:40, Fmean, col = "red", lwd = 3)

legend(1, quantile(unlist(Eff875), 0.9), c("Raw", "Mean"), 
	pch = c(19,19), col = c(1,2))



