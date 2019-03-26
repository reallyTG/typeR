library(FSA)


### Name: perc
### Title: Computes the percentage of values in a vector less than or
###   greater than (and equal to) some value.
### Aliases: perc
### Keywords: misc

### ** Examples

## vector of values
( tmp <- c(1:8,NA,NA) )

## percentages excluding NA values
perc(tmp,5)
perc(tmp,5,"gt")
perc(tmp,5,"leq")
perc(tmp,5,"lt")

## percentages including NA values
perc(tmp,5,na.rm=FALSE)
perc(tmp,5,"gt",na.rm=FALSE)
perc(tmp,5,"leq",na.rm=FALSE)
perc(tmp,5,"lt",na.rm=FALSE)




