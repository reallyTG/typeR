library(IDmining)


### Name: logMINDEX
### Title: The Multipoint Morisita Index in 1, 2 or Higher Dimensions
### Aliases: logMINDEX

### ** Examples

sim_dat <- SwissRoll(1000)

m <- 2
scaleQ <- 1:15 # It starts with a grid of 1^E cell (or quadrat).
               # It ends with a grid of 15^E cells (or quadrats).
lnmMI <- logMINDEX(sim_dat, scaleQ, m, m)

dev.new(width=5, height=4)
plot(exp(lnmMI[,1]),exp(lnmMI[,2]),pch=19,col="black",xlab="",ylab="")
title(xlab = expression(delta), cex.lab = 1.5,line = 2.5)
title(ylab = expression(I['2,'*delta]), cex.lab = 1.5,line = 2.5)

dev.new(width=5, height=4)
plot(lnmMI[,1],lnmMI[,2],pch=19,col="black",xlab="",ylab="")
title(xlab = expression(paste("log(",delta,")")), cex.lab = 1.5,line = 2.5)
title(ylab = expression(paste("log(",I['2,'*delta],")")), cex.lab = 1.5,line = 2.5)



