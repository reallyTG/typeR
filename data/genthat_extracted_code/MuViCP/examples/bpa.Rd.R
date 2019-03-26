library(MuViCP)


### Name: bpa
### Title: Basic Probability Assignment Objects
### Aliases: bpa print.bpa

### ** Examples

##Empty bpa - All mass is attached to ignorance
b1 <- bpa(3)
b1

##Add a set to this bpa
b1$assign.bpa(s = c(1,2), m = c(0.3,0.4))
print(b1, verbose = TRUE)

##The same thing in a different way - classes can be named
##Note that the print method omits empty classes
b0 <- bpa(3, c('A','B','C', Inf), c(0.3, 0.4, 0, 0.3))
b0

##Another bpa
##Again, class '2' has been omitted
b2 <- bpa(3)
b2$assign.bpa(s = c(1,3), m = c(0.7,0.1))
b2

##Combine
b3 <- combine.bpa.ds(b1,b2)
b3
combine.bpa.bs(b1,b2)

##As a list, should be same answer as above
b4 <- combine.bpa.list.ds(list(b1,b2))
b4
combine.bpa.list.bs(list(b1,b2))



