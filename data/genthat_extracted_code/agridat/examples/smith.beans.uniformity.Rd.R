library(agridat)


### Name: smith.beans.uniformity
### Title: Uniformity trials of beans, 2 species in 2 years
### Aliases: smith.beans.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D   
##D   data(smith.beans.uniformity)
##D   dat1 <- subset(smith.beans.uniformity, expt=="E1")
##D   dat2 <- subset(smith.beans.uniformity, expt=="E2")
##D   dat3 <- subset(smith.beans.uniformity, expt=="E3")
##D   dat4 <- subset(smith.beans.uniformity, expt=="E4")
##D 
##D   cv <- function(x) { sd(x)/mean(x) }
##D   cv(dat1$yield)
##D   cv(dat2$yield) # Does not match Smith. Checked all values by hand.
##D   cv(dat3$yield)
##D   cv(dat4$yield)
##D 
##D   require("desplot")
##D   desplot(yield ~ col*row, dat1, 
##D           aspect=180/45, flip=TRUE, # true aspect
##D           main="smith.beans.uniformity, expt 1 (true aspect)")
##D 
##D   desplot(yield ~ col*row, dat2, 
##D           aspect=180/45, flip=TRUE, # true aspect
##D           main="smith.beans.uniformity, expt 2 (true aspect)")
##D 
##D   desplot(yield ~ col*row, dat3, 
##D           aspect=450/80, flip=TRUE, # true aspect
##D           main="smith.beans.uniformity, expt 3 (true aspect)")
##D 
##D   desplot(yield ~ col*row, dat4, 
##D           aspect=450/80, flip=TRUE, # true aspect
##D           main="smith.beans.uniformity expt 4, (true aspect)")
##D   
## End(Not run)



