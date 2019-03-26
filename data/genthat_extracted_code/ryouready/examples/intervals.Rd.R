library(ryouready)


### Name: intervals
### Title: Use standard mathematical interval notation in 'recode' from
###   'car' package
### Aliases: intervals

### ** Examples

## Not run: 
##D  library(car)
##D 
##D  # the standard way if we want to recode [1,2) to the value 3
##D  recode(c(1, 1.999, 2, 2.001), "1:2-1e-4=3")
##D 
##D  # the same using interval notation
##D  intervals("[1,2)=3")
##D  recode(c(1, 1.999, 2, 2.001), intervals("[1,2)=3"))
##D 
##D  # another example: the car way
##D  e <- 10^-8
##D  recode(1:9/3.01, "lo:1-e=0; 1:2-e=1; 2:3-e=2")
##D  # using intervals
##D  recode(1:9/3.01, intervals("[lo,1)=0; [1,2)=1; [2,3)=2"))
## End(Not run)



