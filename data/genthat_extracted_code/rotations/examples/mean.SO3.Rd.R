library(rotations)


### Name: mean.SO3
### Title: Mean rotation
### Aliases: mean.Q4 mean.SO3

### ** Examples

Rs <- ruars(20, rvmises, kappa = 0.01)
mean(Rs)                               #Projected mean
project.SO3(colMeans(Rs))              #Same as mean(Rs)

mean(Rs, type = "geometric")           #Geometric mean
rot.dist(mean(Rs))                     #Bias of the projected mean
rot.dist(mean(Rs, type = "geometric")) #Bias of the geometric mean

Qs <- as.Q4(Rs)
mean(Qs)                               #Projected mean
mean(Qs, type = "geometric")           #Geometric mean
rot.dist(mean(Qs))                     #Bias of the projected mean
rot.dist(mean(Qs, type = "geometric")) #Bias of the geometric mean



