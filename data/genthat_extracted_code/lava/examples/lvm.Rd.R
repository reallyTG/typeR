library(lava)


### Name: lvm
### Title: Initialize new latent variable model
### Aliases: lvm print.lvm summary.lvm
### Keywords: models regression

### ** Examples


m <- lvm() # Empty model
m1 <- lvm(y~x) # Simple linear regression
m2 <- lvm(~y1+y2) # Model with two independent variables (argument)
m3 <- lvm(list(c(y1,y2,y3)~u,u~x+z)) # SEM with three items




