library(psych)


### Name: ellipses
### Title: Plot data and 1 and 2 sigma correlation ellipses
### Aliases: ellipses minkowski
### Keywords: multivariate hplot

### ** Examples

data(galton)
ellipses(galton,lm=TRUE)
ellipses(galton$parent,galton$child,xlab="Mid Parent Height",
                  ylab="Child Height") #input are two vectors
data(sat.act)
ellipses(sat.act)  #shows the pairs.panels ellipses
minkowski(2,main="Minkowski circles")
minkowski(1,TRUE)
minkowski(4,TRUE)




