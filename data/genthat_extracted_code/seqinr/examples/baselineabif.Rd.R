library(seqinr)


### Name: baselineabif
### Title: Estimation of baseline value
### Aliases: baselineabif

### ** Examples

data(JLO)
rfu <- JLO$Data$DATA.1
bl <- baselineabif(rfu)
plot(1:length(rfu), rfu, type = "l", 
  xlab = "Time [datapoint units]",
  ylab = "Signal [RFU]",
  main = "Example of baseline estimates")
abline(h = bl, col="red", lty = 2)
legend("topright", inset = 0.02, "Baseline estimate", lty = 2, col = "red")



