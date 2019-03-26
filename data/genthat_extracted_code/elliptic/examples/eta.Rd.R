library(elliptic)


### Name: eta
### Title: Dedekind's eta function
### Aliases: eta eta.series
### Keywords: math

### ** Examples

 z <- seq(from=1+1i,to=10+0.06i,len=999)
 plot(eta(z))

max(abs(eta(z)-eta.series(z)))



