library(tailloss)


### Name: zoombox
### Title: Function for zooming onto a matplot(x, y, ...).
### Aliases: zoombox

### ** Examples

data(UShurricane)

# Compress the table to millions of dollars

USh.m <- compressELT(ELT(UShurricane), digits = -6)
s <- seq(1,40)
EPC <- matrix(NA, length(s), 6)
colnames(EPC) <- c("Panjer", "MonteCarlo", "Markov",
 "Cantelli", "Moment", "Chernoff")
EPC[, 1] <- fPanjer(USh.m, s = s)[, 2]
EPC[, 2] <- fMonteCarlo(USh.m, s = s)[, 2]
EPC[, 3] <- fMarkov(USh.m, s = s)[, 2]
EPC[, 4] <- fCantelli(USh.m, s = s)[, 2]
EPC[, 5] <- fMoment(USh.m, s = s)[, 2]
EPC[, 6] <- fChernoff(USh.m, s = s)[, 2]
matplot(s, EPC, type = "l", lwd = 2, xlab = "s", ylim = c(0, 1), lty = 1:6,
  ylab = expression(plain(Pr)(S>=s)), main = "Exceedance Probability Curve")
zoombox(s, EPC, x0 = c(30, 40), y0 = c(0, .1), y1 = c(.3, .6), type = "l", lwd = 2, lty = 1:6)
legend("topright", legend = colnames(EPC), lty = 1:6, col = 1:6, lwd = 2)



