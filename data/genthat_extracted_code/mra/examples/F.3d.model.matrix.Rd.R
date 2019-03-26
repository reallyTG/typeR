library(mra)


### Name: F.3d.model.matrix
### Title: 3-Dimensional capture-recapture model matrices
### Aliases: F.3d.model.matrix
### Keywords: models

### ** Examples



# Synthetic example with 10 animals and 5 occasions
nan <- 10
ns <- 5
sex <- as.factor(as.numeric(runif( nan ) > 0.5))
attr(sex,"ns") <- ns
x <- matrix( runif( nan*ns ) , nrow=nan, ncol=ns )
F.3d.model.matrix( ~ ivar(sex) + x, nan, ns )





