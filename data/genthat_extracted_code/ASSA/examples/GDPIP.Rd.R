library(ASSA)


### Name: GDPIP
### Title: A Real-time Vintage of GDP and IP for the US Economy
### Aliases: GDPIP
### Keywords: datasets

### ** Examples

## Plotting GDP and IP (de Carvalho and Rua, 2017; Fig. 4)
data(GDPIP)
par(mar = c(5, 4, 4, 5) + .1)
plot(GDPIP[, 1], type = "l", 
     xlab = "Time", ylab = "Gross Domestic Product (GDP)",
     lwd = 3, col = "red", cex.lab = 1.4, cex.axis = 1.4)
par(new = TRUE)
plot(GDPIP[, 2], type = "l", xaxt = "n", yaxt = "n",
     xlab = "", ylab = "", lwd = 3, col = "blue", cex.axis = 1.4)
axis(4)
mtext("Industrial Production (IP)", side = 4, line = 3, cex = 1.4)
legend("topleft", col = c("red", "blue"),
       lty = 1, lwd = 3, legend = c("GDP", "IP"))



