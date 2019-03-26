library(refset)


### Name: contents
### Title: Returns or changes parcel contents
### Aliases: contents contents<-

### ** Examples

pcl <- wrap(x^2)
x <- 2
contents(pcl)
x <- 3
contents(pcl)
## Not run: 
##D contents(pcl) <- 4 # fails
## End(Not run)
p2 <- wrap(names(x))
contents(p2) <- "named"
x




