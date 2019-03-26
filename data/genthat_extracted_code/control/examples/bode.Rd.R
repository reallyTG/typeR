library(control)


### Name: bode
### Title: Bode Frequency Response for continuous-time Linear Systems.
### Aliases: bode bodeplot

### ** Examples

bode(tf(100, c(1,6,100)))
bode(ssdata(tf(100, c(1,6,100))))

bode(tf(4, c(1,1)))
A <- rbind(c(-2, -1), c(1,0)); B <- rbind(1,0);
C <- cbind(0,1); D <- as.matrix(0);
bode(ss(A,B,C,D))

## MIMO plot
A1 <- rbind(c(0,1), c(-25,-4)); B1 <- rbind(c(1,1), c(0,1))
C1 <- rbind(c(1,0), c(0,1)); D1 <- rbind(c(0,0), c(0,0))
sys1 <- ss(A1,B1,C1,D1)
bodeplot(sys1)
# Use:  par(mfrow = c(2,1)); bodeplot(selectsys(sys1,1,2)) to obtain the response for a subsystem
# of sys1 for input 1 and output 2 only
# RESET your plot layout using par(mfrow = c(1,1))




