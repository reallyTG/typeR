library(agridat)


### Name: bancroft.peanut.uniformity
### Title: Uniformity trial of peanuts
### Aliases: bancroft.peanut.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(bancroft.peanut.uniformity)
##D   dat <- bancroft.peanut.uniformity
##D   
##D   # match means Bancroft page 3
##D   ## dat ##D 
##D   ## # A tibble: 2 x 2
##D   ##   block    mn
##D   ##   <chr> <dbl>
##D   ## 1 B1     2.46
##D   ## 2 B2     2.05
##D   
##D   require(desplot)
##D   desplot(yield ~ col*row|block, dat,
##D           flip=TRUE, aspect=(18*3)/(6*16.66), # true aspect
##D           main="bancroft.peanut.uniformity")
##D 
## End(Not run)  



