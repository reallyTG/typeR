library(partitions)


### Name: conjugate
### Title: Conjugate partitions and Durfee squares
### Aliases: conjugate durfee Durfee
### Keywords: math

### ** Examples

parts(5)
conjugate(parts(5))

restrictedparts(6,4)
conjugate(restrictedparts(6,4))

durfee(10:1)


# Suppose one wanted partitions of 8 with no part larger than 3:

conjugate(restrictedparts(8,3))

# (restrictedparts(8,3) splits 8 into at most 3 parts; 
# so no part of the conjugate partition is larger than 3).






