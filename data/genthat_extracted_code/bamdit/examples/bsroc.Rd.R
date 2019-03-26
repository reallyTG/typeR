library(bamdit)


### Name: bsroc
### Title: bsroc
### Aliases: bsroc
### Keywords: file

### ** Examples


## execute analysis
## Not run: 
##D # Example: data from Glas et al. (2003).....................................
##D 
##D data(glas)
##D glas.t <- glas[glas$marker == "Telomerase", 1:4]
##D glas.m1 <- metadiag(glas.t, re = "normal", link = "logit")
##D bsroc(glas.m1)
##D bsroc(glas.m1, plot.post.bauc = TRUE)
##D 
##D # Example: data from Scheidler et al. (1997)
##D # In this example the range of the observed FPR is less than 20%.
##D # Calculating the BSROC curve makes no sense! You will get a warning message!
##D 
##D data(mri)
##D mri.m <- metadiag(mri)
##D bsroc(mri.m)
## End(Not run)



