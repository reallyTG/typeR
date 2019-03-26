library(cba)


### Name: stress
### Title: Conciseness of Presentation Measures
### Aliases: stress stress.dist
### Keywords: hplot cluster

### ** Examples

##
x1 <- matrix(sample(c(FALSE,TRUE),25,rep=TRUE),ncol=5)
stress(x1)
stress(x1, type="neumann")
##
x2 <- cbind(rbind(matrix(1,4,4),matrix(0,4,4)), 
	    rbind(matrix(0,4,4),matrix(1,4,4)))
stress.dist(x2)
stress.dist(x2, bycol=TRUE)
stress.dist(x2, type="neumann")



