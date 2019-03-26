library(labdsv)


### Name: const
### Title: Constancy Table
### Aliases: const
### Keywords: multivariate

### ** Examples

data(bryceveg) # returns a data.frame called bryceveg
class <- sample(1:10,nrow(bryceveg),replace=TRUE)
const(bryceveg,class,minval=0.25)



