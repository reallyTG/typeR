library(BMA)


### Name: orderplot
### Title: Orderplot of iBMA objects
### Aliases: orderplot orderplot.iBMA.glm orderplot.iBMA.bicreg
###   orderplot.iBMA.surv orderplot.iBMA.intermediate.glm
###   orderplot.iBMA.intermediate.bicreg orderplot.iBMA.intermediate.surv
### Keywords: hplot

### ** Examples


## Not run: 
##D ############ iBMA.glm
##D library("MASS")
##D data(birthwt)
##D  y<- birthwt$lo
##D  x<- data.frame(birthwt[,-1])
##D  x$race<- as.factor(x$race)
##D  x$ht<- (x$ht>=1)+0
##D  x<- x[,-9]
##D  x$smoke <- as.factor(x$smoke)
##D  x$ptl<- as.factor(x$ptl)
##D  x$ht <- as.factor(x$ht)
##D  x$ui <- as.factor(x$ui)
##D 
##D ### add 41 columns of noise
##D noise<- matrix(rnorm(41*nrow(x)), ncol=41)
##D colnames(noise)<- paste('noise', 1:41, sep='')
##D x<- cbind(x, noise)
##D 
##D iBMA.glm.out<- iBMA.glm(x, y,  glm.family="binomial", factor.type=FALSE, 
##D                         verbose = TRUE, thresProbne0 = 5 )
##D orderplot(iBMA.glm.out)
## End(Not run)




