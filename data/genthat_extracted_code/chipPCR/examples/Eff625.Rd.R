library(chipPCR)


### Name: Eff625
### Title: Highly Replicate Number Amplification Curves
### Aliases: Eff625
### Keywords: datasets

### ** Examples

data(Eff625)

plot(NA, NA, xlim = c(1,40), ylim = c(0,max(Eff625)), xlab = "Cycle",
    ylab = "RFU", 
    main = "Amplification Curves with 62.5 Percent Efficiency")
apply(Eff625[, 1:ncol(Eff625)], 2, function(x) lines(1:40,x))

Fmean <- rowMeans(Eff625[, 1:ncol(Eff625)])
lines(1:40, Fmean, col = "red", lwd = 3)

legend(1, quantile(unlist(Eff625), 0.9), c("Raw", "Mean"), 
      pch = c(19,19), col = c(1,2))



