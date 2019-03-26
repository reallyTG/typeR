library(pbatR)


### Name: phe
### Title: Phenotype Object
### Aliases: as.phe is.phe read.phe fread.phe write.phe sort.phe
### Keywords: interface

### ** Examples

# A highly artificial example just to get you used to the syntax
#  of using 'as.phe'.
x <- data.frame( pid    = c(1,1,2,2,2),
                 id     = c(1,2,3,4,5),
                 age    = c(14,45,33,22,21),
                 weight = c(150,100,180,185,110) )
x
myPhe <- as.phe( x );
myPhe

# And just another e.g. capitalizing on prior code
names(x)[1:2] <- c("thepid","theid")
x
myPhe <- as.phe( x, pid="thepid", id="theid" )
myPhe  # same as before!



