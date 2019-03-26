library(gamlss.tr)


### Name: fitTail
### Title: For fitting truncated distribution to the tails of data
### Aliases: fitTail fitTailAll
### Keywords: distribution regression

### ** Examples

data(film90)
F90 <- exp(film90$lborev1)# original scale
# trucated plots
# 10%
w403<- fitTail(F90, family=WEI3)
qqnorm(resid(w403))
abline(0,1, col="red")

## Not run: 
##D # hill -sequential plot 10##D 
##D w1<-fitTailAll(F90)
##D # plot sigma
##D plot(w1[,2])
##D #-----------------
##D #LOGNO
##D l403<- fitTail(F90, family=LOGNO)
##D plot(l403)
##D qqnorm(resid(l403))
##D abline(0,1)
##D #  hill -sequential plot 10##D 
##D l1<-fitTailAll(F90, family=LOGNO)
##D plot(l1[,2])
##D #-------------------------
## End(Not run)



