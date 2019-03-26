library(hamlet)


### Name: extendsymrange
### Title: Extend range of variable limits while retaining a point of
###   symmetricity
### Aliases: extendsymrange
### Keywords: dplot

### ** Examples

set.seed(1)
ex <- rnorm(10)+2

hist(ex, xlim=extendsymrange(ex, sym=0), breaks=100)



