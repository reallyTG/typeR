library(cwhmisc)


### Name: triplot
### Title: Ternary or Triangular Plots.
### Aliases: triplot
### Keywords: hplot

### ** Examples

# some random data in three variables
c1 <- runif(25)
c2 <- runif(25)
c3 <- runif(25)
# basic plot
par(mfrow=c(1,2))
triplot(c1,c2,c3)
# plot with different symbols and a grid
triplot(c1,c2,c3, symb=7, grid=TRUE)



