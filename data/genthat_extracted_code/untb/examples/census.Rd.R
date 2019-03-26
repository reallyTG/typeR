library(untb)


### Name: census
### Title: Construct, coerce, and test for a census object
### Aliases: census as.census is.census
### Keywords: math

### ** Examples


jj <- c(dogs=4,pigs=10,slugs=0,fish=1)

x <- census(jj)   # slugs appear as zero abundance
extant(x)  # slugs gone

x+x   # count method for census objects: order of elements lost


as.census(jj)  # probably NOT what you meant

a <- c(rep("oak",5) ,rep("ash",2),rep("elm",3),rep("xx",4))
# note that "a" is a plain vector here.
as.census(a)



