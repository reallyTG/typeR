library(tempR)


### Name: tcata.diff.plot
### Title: TCATA difference plot
### Aliases: tcata.diff.plot

### ** Examples

# difference between High and Low ethanol wines (sip 1)
x.diff.raw <- t(syrah[seq(1, 1026, by = 6), -c(1:4)]) -
                t(syrah[seq(3, 1026, by = 6), -c(1:4)])
x.diff.smooth <- get.smooth(x.diff.raw, low.bound = -1, up.bound = 1)
colnames(x.diff.smooth) <- colnames(x.diff.raw) <- times <- 10:180
tcata.diff.plot(x1 = x.diff.smooth, attributes = rownames(x.diff.smooth), times = times, lwd = 2,
                main = "Sip 1 differences: High-ethanol wine - Low-ethanol wine")

# an example based on the syrah data set (truncated for efficiency)
n <- 52
H1 <- t(syrah[seq(1, 126, by = 6), -c(1:4)] * n)
L1 <- t(syrah[seq(3, 126, by = 6), -c(1:4)] * n)
colnames(H1) <- colnames(L1) <- times <- 10:30
tcata.diff.plot(x1 = H1, x2 = L1, n1 = n, n2 = n,
                attributes = rownames(H1), get.decluttered = TRUE, lwd = 2)



