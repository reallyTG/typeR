library(secr)


### Name: transformations
### Title: Transform Point Array
### Aliases: transformations flip flip.traps flip.popn rotate rotate.traps
###   rotate.popn shift shift.traps shift.popn shift.mask
### Keywords: manip

### ** Examples


temp <- matrix(runif (20) * 2 - 1, nc = 2)

## flip
temp2 <- flip(temp, lr = 1)
plot(temp, xlim=c(-1.5,4), ylim = c(-1.5,1.5), pch = 16)
points (temp2, pch = 1)
arrows (temp[,1], temp[,2], temp2[,1], temp2[,2], length = 0.1)
abline(v = 1, lty = 2)

## rotate
temp2 <- rotate(temp, 25)
plot(temp, xlim=c(-1.5,1.5), ylim = c(-1.5,1.5), pch = 16)
points (0,0, pch=2)
points (temp2, pch = 1)
arrows (temp[,1], temp[,2], temp2[,1], temp2[,2], length = 0.1)	

## shiftxy
temp2 <- shift(temp, c(0.1, 0.1))
plot(temp, xlim=c(-1.5,1.5), ylim = c(-1.5,1.5), pch = 16)
points (0,0, pch=2)
points (temp2, pch = 1)
arrows (temp[,1], temp[,2], temp2[,1], temp2[,2], length = 0.1)	

## flip.traps
par(mfrow = c(1,2), xpd = TRUE)
traps1 <- make.grid(nx = 8, ny = 6, ID = "numxb")
traps2 <- flip (traps1, lr = TRUE)
plot(traps1, border = 5, label = TRUE, offset = 7, gridl = FALSE)
plot(traps2, border = 5, label = TRUE, offset = 7, gridl = FALSE)
par(mfrow = c(1,1), xpd = FALSE)

## rotate.traps
hollow1 <- make.grid(nx = 8, ny = 8, hollow = TRUE)
nested <- rbind (hollow1, rotate(hollow1, 45, c(70, 70)))
plot(nested, gridlines = FALSE)

## shift.traps
hollow1 <- make.grid(nx = 8, ny = 8, hollow = TRUE)
hollow2 <- shift(make.grid(nx = 6, ny = 6, hollow = TRUE), c(20, 20))
nested <- rbind (hollow1, hollow2)
plot(nested, gridlines = FALSE, label = TRUE)




