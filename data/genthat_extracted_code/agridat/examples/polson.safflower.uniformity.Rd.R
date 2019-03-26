library(agridat)


### Name: polson.safflower.uniformity
### Title: Uniformity trial of safflower
### Aliases: polson.safflower.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D   data(polson.safflower.uniformity)
##D   dat <- polson.safflower.uniformity
##D   
##D   require(desplot)
##D   desplot(yield ~ col*row, data=dat,
##D           flip=TRUE, aspect=189/110, # true aspect
##D           main="polson.safflower.uniformity")
##D 
##D   require(agricolae)
##D   require(reshape2)
##D   dmat <- acast(dat, row~col, value.var="yield")
##D   # Similar to Polson fig 4.
##D   tab <- index.smith(dmat, col="red",
##D                      main="polson.safflower.uniformity - Smith Index",
##D                      xlab="Plot size in number of basic plots")
##D   
##D   # Polson p. 25 said CV decreased from 14.3 to 4.5
##D   # for increase from 1 unit to 90 units.  Close match.
##D   tab <- data.frame(tab$uniformity)
##D 
##D   # Polson only uses log(Size) < 2 in his Fig 5, obtained slope -0.63
##D   coef(lm(log(Vx) ~ log(Size), subset(tab, Size <= 6))) # -0.70
##D 
##D   # Polson table 2 reported labor for
##D   # K1, number of plots, 133 hours 75##D 
##D   # K2, size of plot, 43.5 hours 24##D 
##D   # Optimum plot size
##D   # X = b K1 / ((1-b) K2)
##D   # Polson suggests optimum plot size 2.75 to 11 basic plots
##D   
## End(Not run)



