library(spatstat)


### Name: sharpen
### Title: Data Sharpening of Point Pattern
### Aliases: sharpen sharpen.ppp
### Keywords: spatial nonparametric

### ** Examples

   data(shapley)
   X <- unmark(shapley)
   ## Don't show: 
   if(!(interactive())) X <- rthin(X, 0.05)
   
## End(Don't show)
   Y <- sharpen(X, sigma=0.5)
   Z <- sharpen(X, sigma=0.5, edgecorrect=TRUE)
   opa <- par(mar=rep(0.2, 4))
   plot(solist(X, Y, Z), main= " ",
        main.panel=c("data", "sharpen", "sharpen, correct"),
        pch=".", equal.scales=TRUE, mar.panel=0.2)
   par(opa)



