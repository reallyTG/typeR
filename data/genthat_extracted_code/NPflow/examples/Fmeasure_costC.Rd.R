library(NPflow)


### Name: Fmeasure_costC
### Title: Multiple cost computations with Fmeasure as the loss function
### Aliases: Fmeasure_costC

### ** Examples

library(NPflow)
c <- list(c(1,1,2,3,2,3), c(1,1,1,2,3,3),c(2,2,1,1,1,1))
#Fmeasure_costC(sapply(c, "["))

## Not run: 
##D c2 <- list()
##D for(i in 1:100){
##D     c2 <- c(c2, list(rmultinom(n=1, size=2000, prob=rexp(n=2000))))
##D }
##D Fmeasure_costC(sapply(c2, "["))
## End(Not run)




