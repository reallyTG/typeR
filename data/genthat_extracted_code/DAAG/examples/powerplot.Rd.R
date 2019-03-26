library(DAAG)


### Name: powerplot
### Title: Plot of Power Functions
### Aliases: powerplot
### Keywords: models

### ** Examples

   oldpar <- par(mfrow = c(2, 3), mar = par()$mar - c(
        1, 1, 1.0, 1),  mgp = c(1.5, 0.5, 0),  oma=c(0,1,0,1))
#    on.exit(par(oldpar))
    powerplot(expr="sqrt(x)", xlab="")
    powerplot(expr="x^0.25", xlab="", ylab="")
    powerplot(expr="log(x)", xlab="", ylab="")
    powerplot(expr="x^2")
    powerplot(expr="x^4", ylab="")  
    powerplot(expr="exp(x)", ylab="")
par(oldpar)


