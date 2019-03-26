library(R2MLwiN)


### Name: mlwinfitIGLS-class
### Title: An S4 class that stores the outputs of the fitted IGLS model.
### Aliases: mlwinfitIGLS-class

### ** Examples

## Not run: 
##D library(R2MLwiN)
##D # NOTE: if MLwiN not saved in location R2MLwiN defaults to, specify path via:
##D # options(MLwiN_path = 'path/to/MLwiN vX.XX/')
##D # If using R2MLwiN via WINE, the path may look like this:
##D # options(MLwiN_path = '/home/USERNAME/.wine/drive_c/Program Files (x86)/MLwiN vX.XX/')
##D 
##D ## Example: tutorial
##D data(tutorial, package = "R2MLwiN")
##D 
##D (mymodel <- runMLwiN(normexam ~ 1 + standlrt + (1 + standlrt | school) + (1 | student),
##D                      data = tutorial))
##D 
##D ##summary method
##D summary(mymodel)
##D 
##D ##logLik method
##D logLik(mymodel)
## End(Not run)




