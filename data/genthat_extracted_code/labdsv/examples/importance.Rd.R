library(labdsv)


### Name: importance
### Title: Importance Table
### Aliases: importance
### Keywords: multivariate

### ** Examples

    data(bryceveg) # returns a data.frame called bryceveg
    class <- sample(1:10,nrow(bryceveg),replace=TRUE)
    importance(bryceveg,class,minval=0.25)



