library(Rsmlx)


### Name: pkbuild
### Title: Automatic PK model building
### Aliases: pkbuild

### ** Examples

## Not run: 
##D # Build a PK model for the warfarin PK data. 
##D # By default, only models using clearance (and inter compartmental clearances) are used
##D warf.pk1 <- pkbuild(data=warfarin)
##D 
##D # Models using elimination and transfer rate constants are used, 
##D # as well as nonlinear elimination models
##D warf.pk2 <- pkbuild(data=warfarin,  new.dir="warfarin", param="rate", MM=TRUE)
##D 
##D # Both models using clearances and rates are used. 
##D # Level is set to 7 in order to get accurate results.
##D warf.pk3 <- pkbuild(data=warfarin,  new.dir="warfarin", param="both", level=7)
## End(Not run)



