library(agridat)


### Name: depalluel.sheep
### Title: Latin square of four breeds of sheep with four diets
### Aliases: depalluel.sheep
### Keywords: datasets

### ** Examples

data(depalluel.sheep)
dat <- depalluel.sheep

# Not the best view...weight gain is large in the first month, then slows down
# and the linear line hides this fact
require(lattice)
xyplot(weight ~ date|food, dat, group=animal, type='l', auto.key=list(columns=4),
       xlab="Months since start",
       main="depalluel.sheep")



