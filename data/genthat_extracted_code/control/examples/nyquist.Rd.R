library(control)


### Name: nyquist
### Title: Nyquist Frequency Response for continuous-time Linear Systems.
### Aliases: nyquist nyquistplot

### ** Examples

nyquist(tf(100, c(1,6,100)))
nyquist(ssdata(tf(100, c(1,6,100))))

## Not run:  MIMO plot 
A1 <- rbind(c(0,1), c(-25,-4)); B1 <- rbind(c(1,1), c(0,1))
C1 <- rbind(c(1,0), c(0,1)); D1 <- rbind(c(0,0), c(0,0))
sys1 <- ss(A1,B1,C1,D1)
nyquistplot(sys1)
## Not run: 
##D  Use nyquistplot(selectsys(sys1,1,2)) to obtain the response for a subsystem
##D  of sys1 for input 1 and output 2 only.
##D 
##D  RESET your plot layout using par(mfrow = c(1,1)
##D    
## End(Not run)




