library(codep)


### Name: Product-distribution
### Title: Frequency distributions for MCA parametric testing
### Aliases: Product-distribution dphi pphi dtau ptau

### ** Examples

#
### Displays the phi probability distribution for five different numbers
### of degrees of freedom:
#
x <- 10^seq(-4, 0.5, 0.05)
plot(y = dphi(x, 1, 10), x = x, type = "l", col = "black", las = 1, ylab = "pdf",
  ylim = c(0, 0.5))
lines(y = dphi(x, 3, 10), x = x, col = "purple")
lines(y = dphi(x, 5, 70), x = x, col = "blue")
lines(y = dphi(x, 12, 23), x = x, col = "green")
lines(y = dphi(x, 35, 140), x = x, col = "red")
#
### Displays the density distribution function for 10 degrees of freedom
### and the cumulative probability above x = 1.
#
x <- 10^seq(-4, 0.5, 0.05)
y <- dphi(x, 5, 70)
plot(y = y, x = x, type = "l", col = "black", las = 1, ylab = "Density",
  ylim = c(0, 0.5))
polygon(x = c(x[81L:91], x[length(x)], 1), y = c(y[81L:91], 0, 0),
  col = "grey")
text(round(pphi(1, 5, 70, lower.tail=FALSE), 3), x = 1.75, y = 0.05)
#
### Idem for the tau distribution:
#
x <- c(-(10^seq(0.5, -4, -0.05)), 10^seq(-4, 0.5, 0.05))
plot(y = dtau(x, 1), x = x, type = "l", col = "black", las = 1,
   ylab = "pdf", ylim = c(0, 0.5))
lines(y = dtau(x, 2), x = x, col = "purple")
lines(y = dtau(x, 5), x = x, col="blue")
lines(y = dtau(x, 10), x = x, col="green")
lines(y = dtau(x, 100), x = x, col="red")
#
y <- dtau(x, 10)
plot(y = y, x = x, type = "l", col = "black", las = 1, ylab = "Density",
  ylim = c(0, 0.5))
polygon(x = c(x[which(x==1):length(x)], x[length(x)],1),
  y = c(y[which(x==1):length(x)], 0, 0), col = "grey")
text(round(ptau(1, 10, lower.tail = FALSE), 3), x = 1.5, y = 0.03)
polygon(x = c(-1, x[1L], x[1L:which(x==-1)]),
  y = c(0, 0, y[1L:which(x==-1)]), col="grey")
text(round(ptau(-1, 10), 3), x = -1.5, y = 0.03)
#



