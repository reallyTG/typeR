library(gap)


### Name: metareg
### Title: Fixed and random effects model for meta-analysis
### Aliases: metareg
### Keywords: models

### ** Examples

## Not run: 
##D abc <- data.frame(chromosome=1,rsn='abcd',startpos=1234,
##D                   b1=1,se1=2,p1=0.1,b2=2,se2=6,p2=0,b3=3,se3=8,p3=0.5)
##D metareg(abc,3)
##D abc2 <- data.frame(b1=c(1,2),se1=c(2,4),b2=c(2,3),se2=c(4,6),b3=c(3,4),se3=c(6,8))
##D print(metareg(abc2,3))
## End(Not run)



