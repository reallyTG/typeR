library(agridat)


### Name: yates.missing
### Title: Factorial experiment with missing values
### Aliases: yates.missing

### ** Examples


data(yates.missing)
dat <- yates.missing

require(lattice)
bwplot(y ~ trt, data=dat,
       xlab="Treatment", ylab="Infection intensity",
       main="yates.missing")

if(require(reshape2)){
mat0 <- acast(dat[, c('trt','block','y')], trt~block,
               id.var=c('trt','block'), value.var='y')

# Use lm to estimate missing values.  The estimated missing values
# are the same as in Yates (1933)
m1 <- lm(y~trt+block, dat)
dat$pred <- predict(m1, new=dat[, c('trt','block')])
dat$filled <- ifelse(is.na(dat$y), dat$pred, dat$y)
mat1 <- acast(dat[, c('trt','block','pred')], trt~block,
               id.var=c('trt','block'), value.var='pred')
}

## Not run: 
##D # Another method to estimate missing values via PCA
##D require("nipals")
##D m2 <- nipals(mat0, center=FALSE, ncomp=3, fitted=TRUE)
##D # mat2 <- m2$scores ##D 
##D mat2 <- m2$fitted
##D 
##D # Compare
##D ord <- c("0","N","K","P","NK","NP","KP","NKP")
##D print(mat0[ord,], na.print=".")
##D round(mat1[ord,] ,2)
##D round(mat2[ord,] ,2)
##D 
##D # SVD with 3 components recovers original data better
##D sum((mat0-mat1)^2, na.rm=TRUE)
##D sum((mat0-mat2)^2, na.rm=TRUE) # Smaller SS => better fit
## End(Not run)



