library(sfsmisc)


### Name: integrate.xy
### Title: Cheap Numerical Integration through Data points.
### Aliases: integrate.xy
### Keywords: math utilities

### ** Examples

 x <- 1:4
 integrate.xy(x, exp(x))
 print(exp(4) - exp(1), digits = 10) # the true integral

 for(n in c(10, 20,50,100, 200)) {
   x <- seq(1,4, len = n)
   cat(formatC(n,wid=4), formatC(integrate.xy(x, exp(x)), dig = 9),"\n")
 }



