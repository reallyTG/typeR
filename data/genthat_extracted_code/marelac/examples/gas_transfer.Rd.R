library(marelac)


### Name: gas_transfer
### Title: The Gas Transfer Coefficient in m/sec
### Aliases: gas_transfer
### Keywords: utilities

### ** Examples

useq <- 0:15
plot(useq, gas_transfer(u10 = useq, species = "O2"), type = "l", lwd = 2, xlab = "u10, m/s",
     ylab = "m/s", main = "O2 gas transfer velocity", , ylim = c(0, 0.0003))
lines(useq, gas_transfer(u10 = useq, species = "O2", method = "Nightingale"), lwd = 2, lty = 2)
lines(useq, gas_transfer(u10 = useq, species = "O2", method = "Wanninkhof1"), lwd = 2, lty = 3)
lines(useq, gas_transfer(u10 = useq, species = "O2", method = "Wanninkhof2"), lwd = 2, lty = 4)

legend("topleft", lty = 1:4, lwd = 2,
  legend = c("Liss and Merlivat 1986", "Nightingale et al. 2000",
  "Wanninkhof 1992", "Wanninkhof and McGills 1999"))



