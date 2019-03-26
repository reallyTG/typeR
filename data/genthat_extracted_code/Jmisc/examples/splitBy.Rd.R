library(Jmisc)


### Name: splitBy
### Title: Split a vector by a sequence of length
### Aliases: splitBy

### ** Examples

splitBy((1:10)*10,c(2,2))
splitBy((1:10)*10,c(2,3,4))
## Not run: 
##D expect_equivalent(splitBy((1:10)*10,c(2,2)) ,  list(c(10,20),c(30,40)))
##D expect_equivalent(splitBy((1:10)*10,c(2,3,4)) , list( c(10,20), c(30,40,50) ,c(60,70,80,90)  ))
## End(Not run)



