library(vars)


### Name: restrict
### Title: Restricted VAR
### Aliases: restrict
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
## Restrictions determined by thresh
restrict(var.2c, method = "ser")
## Restrictions set manually
restrict <- matrix(c(1, 1, 1, 1, 1, 1, 0, 0, 0, 
                     1, 0, 1, 0, 0, 1, 0, 1, 1,
                     0, 0, 1, 1, 0, 1, 0, 0, 1,
                     1, 1, 1, 0, 1, 1, 0, 1, 0),
                   nrow=4, ncol=9, byrow=TRUE)
restrict(var.2c, method = "man", resmat = restrict)



