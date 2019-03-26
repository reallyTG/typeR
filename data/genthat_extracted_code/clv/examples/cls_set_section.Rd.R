library(clv)


### Name: cls.set.section
### Title: Section of two subsets - External Measure utilities
### Aliases: cls.set.section
### Keywords: cluster

### ** Examples

# create two different subsamples 
mx1 <- matrix(as.integer( c(1,2,3,4,5,6,1,1,2,2,3,3) ), 6, 2 )
mx2 <- matrix(as.integer( c(1,2,4,5,6,7,1,1,2,2,3,3) ), 6, 2 )
# find section
m = cls.set.section(mx1,mx2)



