library(R2MLwiN)


### Name: caterpillarR
### Title: Draws caterpillar plots of the residuals from a
###   mlwinfitIGLS-class or mlwinfitMCMC-class object, at a chosen level of
###   the multilevel model.
### Aliases: caterpillarR

### ** Examples


## Not run: 
##D library(R2MLwiN)
##D # NOTE: if MLwiN not saved where R2MLwiN defaults to:
##D # options(MLwiN_path = 'path/to/MLwiN vX.XX/')
##D # If using R2MLwiN via WINE, the path may look like:
##D # options(MLwiN_path = '/home/USERNAME/.wine/drive_c/Program Files (x86)/MLwiN vX.XX/') 
##D 
##D # Example using tutorial dataset
##D data(tutorial, package = 'R2MLwiN')
##D mymodel <- runMLwiN(normexam ~ 1 + (1 | school) + (1 | student),
##D                     estoptions = list(resi.store = TRUE),
##D                     data = tutorial)
##D # Caterpillar plot
##D caterpillarR(mymodel['residual'], lev = 2)
## End(Not run)




