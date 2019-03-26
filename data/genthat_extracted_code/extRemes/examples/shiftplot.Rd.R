library(extRemes)


### Name: shiftplot
### Title: Shift Plot Between Two Sets of Data
### Aliases: shiftplot
### Keywords: hplot

### ** Examples

z <- rnorm( 100)
y <- rexp(30)
shiftplot( z, y)

data( ftcanmax)
shiftplot( y, ftcanmax[,"Prec"])



