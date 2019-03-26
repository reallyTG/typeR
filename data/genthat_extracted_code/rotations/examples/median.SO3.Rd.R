library(rotations)


### Name: median.SO3
### Title: Median rotation
### Aliases: median median.Q4 median.SO3

### ** Examples

Rs <- ruars(20, rvmises, kappa = 0.01)
median(Rs)                               #Projected median
median(Rs, type = "geometric")           #Geometric median
rot.dist(median(Rs))                     #Bias of the projected median
rot.dist(median(Rs, type = "geometric")) #Bias of the geometric median

Qs <- as.Q4(Rs)
median(Qs)                               #Projected median
median(Qs, type = "geometric")           #Geometric median
rot.dist(median(Qs))                     #Bias of the projected median
rot.dist(median(Qs, type = "geometric")) #Bias of the geometric median



