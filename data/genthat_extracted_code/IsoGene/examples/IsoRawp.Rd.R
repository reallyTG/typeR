library(IsoGene)


### Name: IsoRawp
### Title: IsoRawp
### Aliases: IsoRawp
### Keywords: htest

### ** Examples

## Not run: 
##D   set.seed(1234)
##D   x <- c(rep(1,3),rep(2,3),rep(3,3))
##D   y1 <- matrix(rnorm(90, 1,1),10,9)  # 10 genes with no trends
##D   y2 <- matrix(c(rnorm(30, 1,1), rnorm(30,2,1),
##D                  rnorm(30,3,1)), 10, 9)  # 10 genes with increasing trends
##D   y <- data.frame(rbind(y1, y2))  # y needs to be a data frame 
##D   rp <- IsoRawp(x, y, niter = 1000)
##D   rp
## End(Not run)



