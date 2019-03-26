library(geosptdb)


### Name: cp.xnews
### Title: Generate the principal coordinates of a new individual from
###   Gower's distance.
### Aliases: cp.xnews
### Keywords: spatial

### ** Examples

## Not run: 
##D data(croatia.temp)
##D data(croatiadb)
##D # prediction case: one point
##D point <- data.frame(670863,5043464,5,170,200,15.7,3)
##D names(point) <- c("x","y","t","dem","dsea","twi","est")
##D 
##D croatia.temp[,7] <- as.factor(croatia.temp[,7])
##D dblm1 <- dblm(data=croatia.temp,y=croatiadb$MTEMP)                                 
##D newdata1 <- t(cp.xnews(newdata=point,eigenvalues=dblm1$ev, data=croatia.temp,
##D                        trend=dblm1$cp))
##D colnames(newdata1) <- c("X1","X2","X3","X4","X5","X6","X7","X8","X9","X10")
## End(Not run)



