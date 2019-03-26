library(ape)


### Name: bd.time
### Title: Time-Dependent Birth-Death Models
### Aliases: bd.time
### Keywords: models

### ** Examples

set.seed(3)
tr <- rbdtree(0.1, 0.02)
bd.time(tr, 0, 0) # fits a simple BD model
bd.time(tr, 0, 0, ip = c(.1, .01)) # 'ip' is useful here
## the classic logistic:
birth.logis <- function(a, b) 1/(1 + exp(-a*t - b))
## Not run: 
##D bd.time(tr, birth.logis, 0, ip = c(0, -2, 0.01))
##D ## slow to get:
##D ## $par
##D ##            a            b        death
##D ## -0.003486961 -1.995983179  0.016496454
##D ##
##D ## $SS
##D ## [1] 20.73023
## End(Not run)



