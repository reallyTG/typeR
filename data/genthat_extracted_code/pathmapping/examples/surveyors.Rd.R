library(pathmapping)


### Name: surveyors
### Title: The Surveyor's Formula
### Aliases: surveyors surveyors.3 surveyors.4 shoelace

### ** Examples



poly <- rbind(c(1,1),c(10,1),c(5,3))
surveyors(poly)

## Profiling test for 3-gon
  poly <- rbind(c(1.1,1.2),c(2.1,3.3),c(4.1,1.2))
#system.time(for(i in 1:50000)surveyors(poly,usedet=TRUE))
#system.time(for(i in 1:50000)surveyors(poly))
#system.time(for(i in 1:50000)surveyors.3(poly))
#system.time(for(i in 1:50000)shoelace(poly))
# Profiling Test for 4-gon
poly2 <- rbind(c(1.1,1.2),c(2.2,1.3),c(4.0,4.25),c(1.3,3.9))
#system.time(for(i in 1:50000)surveyors(poly2,usedet=TRUE))
#system.time(for(i in 1:50000)surveyors(poly2))
#system.time(for(i in 1:50000)surveyors.4(poly2))
#system.time(for(i in 1:50000)shoelace(poly2))

poly3 <- cbind(runif(20),runif(20))
#system.time(for(i in 1:50000)surveyors(poly3,usedet=TRUE))
#system.time(for(i in 1:50000)shoelace(poly3))



