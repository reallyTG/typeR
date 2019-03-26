library(pairwise)


### Name: simra
### Title: Simulate Response Pattern under Dichotomous and Polytomous Rasch
###   Model
### Aliases: simra

### ** Examples

########
simra() # 100 dichotomous probabilistic response pattern
### 100 polytomous response pattern (4 items; each 4 answer categories)
v <- c(-1.0,-0.5,0.0,0.5,-0.75,-0.25,0.25,0.75,-0.5,0.0,0.5,1.0)
itempar <- matrix(v,nrow = 4,ncol = 3)
simra(itempar = itempar)
simra(itempar = itempar,replicate = 10) # draw 10 replications




