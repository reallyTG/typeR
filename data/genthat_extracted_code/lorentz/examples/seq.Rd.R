library(lorentz)


### Name: seq.3vel
### Title: seq method for three velocities
### Aliases: seq.3vel

### ** Examples


 a <- as.3vel(c(4,5,6)/9)
 b <- as.3vel(c(-5,6,8)/14)
 x <- seq(a,b,len=9)

x[1]-a # should be zero
x[9]-b # should be zero


jj <- a + seq(0,1,len=9)*(b-a)

jj-x   # decidedly non-zero





