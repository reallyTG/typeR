library(R2MLwiN)


### Name: predCurves
### Title: Draws predicted curves (lines) using estimates from the fixed
###   part of a fitted model.
### Aliases: predCurves

### ** Examples


## Not run: 
##D library(R2MLwiN)
##D # NOTE: if MLwiN not saved in location R2MLwiN defaults to, specify path via:
##D # options(MLwiN_path = 'path/to/MLwiN vX.XX/')
##D # If using R2MLwiN via WINE, the path may look like this:
##D # options(MLwiN_path = '/home/USERNAME/.wine/drive_c/Program Files (x86)/MLwiN vX.XX/')
##D 
##D ## Read alevchem data
##D data(alevchem, package = "R2MLwiN")
##D 
##D alevchem$gcseav <- double2singlePrecision(alevchem$gcse_tot/alevchem$gcse_no - 6)
##D # Avoids warning when fitting factor as continuous response:
##D alevchem$a_point_num <- as.numeric(alevchem$a_point)
##D 
##D ## Example: A-level Chemistry
##D (mymodel <- runMLwiN(a_point_num ~ 1 + gcseav + I(gcseav^2) + I(gcseav^3)
##D                      + gender + (1 | pupil), estoptions = list(EstM = 1,  resi.store = TRUE),
##D                      data = alevchem))
##D                      
##D predCurves(mymodel, xname = "gcseav", group = "genderfemale")
## End(Not run)




