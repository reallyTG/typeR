library(gdimap)


### Name: simul.fandtasia
### Title: Simulation of Curved Fibre Bundles for von Mises-Fisher Fibre
###   Orientation Mapping
### Aliases: simul.fandtasia
### Keywords: utilities

### ** Examples

## Not run: 
##D     ## simulation with a new generated field of profiles,
##D     ## of size 16x16 (for speed), with added noise 
##D     simul.fandtasia(gridsz=16, sigma=0.01)
##D     simul.fandtasia(gdi="gqi2", gridsz=16, sigma=0.01)
##D     ## same as before, but showing crossing-fibre glyphs 
##D     simul.fandtasia(gridsz=16, sigma=0.01, showglyph=TRUE)
##D     simul.fandtasia(gdi="gqi2", gridsz=16, sigma=0.01, showglyph=TRUE)
##D     ## using a 32x32 data field as in the original reference
##D     ## Warning: time-consuming example
##D     simul.fandtasia()
##D     ## speeded up approximations: hardmax and numeric kappa
##D     simul.fandtasia(gridsz=16, sigma=0.01, E="hardmax", kappa=20)
## End(Not run)



