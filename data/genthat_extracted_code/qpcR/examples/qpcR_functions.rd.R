library(qpcR)


### Name: qpcR_functions
### Title: The nonlinear/mechanistic models implemented in qpcR
### Aliases: l7 l6 l5 l4 b7 b6 b5 b4 expGrowth expSDM linexp mak2 mak2i
###   mak3 mak3i lin2 cm3 spl3
### Keywords: models nonlinear

### ** Examples

m1 <- pcrfit(reps, 1, 2, b4)
m2 <- pcrfit(reps, 1, 2, b5)
m3 <- pcrfit(reps, 1, 2, l6)
m4 <- pcrfit(reps, 1, 2, l7)

## Get the second derivative
## curve of m2.
d2 <- b5$d2(m2$DATA[, 1], coef(m2))
plot(m2)
lines(d2, col = 2)  



