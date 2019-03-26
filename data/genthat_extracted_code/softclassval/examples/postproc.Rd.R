library(softclassval)


### Name: postproc
### Title: Attach postprocessing function to operator
### Aliases: postproc postproc<-

### ** Examples


postproc (wRMSE)
myop <- function (r, p) p * (r == 1)
postproc (myop) <- `sqrt`




