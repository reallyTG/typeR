library(gap)


### Name: gif
### Title: Kinship coefficient and genetic index of familiality
### Aliases: gif
### Keywords: datagen

### ** Examples

## Not run: 
##D test<-c(
##D  5,      0,      0,
##D  1,      0,      0,
##D  9,      5,      1,
##D  6,      0,      0,
##D 10,      9,      6,
##D 15,      9,      6,
##D 21,     10,     15,
##D  3,      0,      0,
##D 18,      3,     15,
##D 23,     21,     18,
##D  2,      0,      0,
##D  4,      0,      0,
##D  7,      0,      0,
##D  8,      4,      7,
##D 11,      5,      8,
##D 12,      9,      6,
##D 13,      9,      6,
##D 14,      5,      8,
##D 16,     14,      6,
##D 17,     10,      2,
##D 19,      9,     11,
##D 20,     10,     13,
##D 22,     21,     20)
##D test<-matrix(test,ncol=3,byrow=TRUE)
##D gif(test,gifset=c(20,21,22))
##D 
##D # all individuals
##D gif(test,gifset=1:23)
## End(Not run)



