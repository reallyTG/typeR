library(chipPCR)


### Name: chipPCR.datasets
### Title: Overview for data sets of the 'chipPCR' package
### Aliases: chipPCR.datasets
### Keywords: datasets melt iQ5 qPCR qIA isothermal real-time VideoScan
###   ccPCR Bio-Rad iQ5 CFX96

### ** Examples

data(VIMiQ5_melt)

tmp <- VIMiQ5_melt

plot(NA, NA, xlim = c(55,95), ylim = c(0, 40000), 
    xlab = "Temperature (degrees Celsius)",ylab = "RFU", 
    main = "Melting curve in iQ5 (Bio-Rad)")
apply(tmp[, 2:ncol(tmp)], 2, 
      function(x) lines(tmp[1:nrow(tmp),1],x))

Fmean <- rowMeans(tmp[, 2:ncol(tmp)])
lines(tmp[1:nrow(tmp),1], Fmean, col = "red", lwd = 3)

legend(55, 4000, c("Raw", "Mean"), pch = c(19,19), col = c(1,2))



