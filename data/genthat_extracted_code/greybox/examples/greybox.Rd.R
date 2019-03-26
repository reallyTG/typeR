library(greybox)


### Name: greybox
### Title: Grey box
### Aliases: greybox greybox-package
### Keywords: models nonlinear regression ts

### ** Examples


## Not run: 
##D xreg <- cbind(rnorm(100,10,3),rnorm(100,50,5))
##D xreg <- cbind(100+0.5*xreg[,1]-0.75*xreg[,2]+rnorm(100,0,3),xreg,rnorm(100,300,10))
##D colnames(xreg) <- c("y","x1","x2","Noise")
##D 
##D stepwise(xreg)
## End(Not run)




