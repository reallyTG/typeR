library(adaptivetau)


### Name: ssa.maketrans
### Title: Make transition matrix
### Aliases: ssa.maketrans
### Keywords: datagen

### ** Examples


## trivial Lotka-Volterra example from ssa.adaptivetau
nu = ssa.maketrans(2, #number of variables
                   rbind(1, +1),
                   rbind(1, -1, 2, +1),
                   rbind(2, -1))

## slightly more complicated SIR epidemiological model with two distinct
## susceptible and infected variables (think male and female), birth
## (into S) and death (exclusively from I and R)
nu = ssa.maketrans(c("Sm", "Sf", "Im", "If", "R"), #list of variable names
                   rbind(c("Sm","Sf"), +1),
                   rbind(c("Sm","Sf"), -1, c("Im","If"), +1),
                   rbind(c("Im","If"), -1),
                   rbind(c("Im","If"), -1, "R", +1),
                   rbind("R", -1))



