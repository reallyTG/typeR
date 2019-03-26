library(gdimap)


### Name: simulglyph.vmf
### Title: Voxel Diffusion Profile Simulation and von Mises-Fisher Fibre
###   Mapping
### Aliases: simulglyph.vmf
### Keywords: utilities

### ** Examples

## Not run: 
##D     ## Examples of synthetized voxel diffusion glyphs
##D     ## ODF glyphs, and vMF fiber orientation mapping 
##D     ## noise-free simulations and vMF estimation by GQI and QBI
##D     b <- 3000; angles <- c(20,110)
##D     simulglyph.vmf(angles=angles,b=b, gdi="gqi")
##D     simulglyph.vmf(angles=angles,b=b, gdi="gqi", logplot=FALSE)
##D     simulglyph.vmf(angles=angles,b=b, gdi="gqi2")
##D     simulglyph.vmf(angles=angles,b=b, gdi="gqi2", logplot=FALSE)
##D     ## test reconstruction with aniso factor
##D     simulglyph.vmf(angles=angles,b=b, gdi="gqi", aniso=0.5)
##D     ## Spherical harmonics model
##D     simulglyph.vmf(angles=angles,b=b, gdi="sph")
##D     simulglyph.vmf(angles=angles,b=b, gdi="sph", aniso=0.5)
##D     ## plot diffusion signal with "logplot=FALSE"
##D     angles <- 45; b <- 1500
##D     simulglyph.vmf(angles=angles,b=b, gdi="gqi",  logplot=FALSE)
##D     simulglyph.vmf(angles=angles,b=b, gdi="gqi2", logplot=FALSE)
##D     ## 2 direction, lower crossing-angles, higher b
##D     angles <- c(20,80); b <- 6000
##D     simulglyph.vmf(angles=angles,b=b, gdi="gqi")
##D     simulglyph.vmf(angles=angles,b=b, gdi="sph")
##D     ## 2 direction, different volume fractions
##D     simulglyph.vmf(angles=angles, b=b, wi=c(0.7, 0.3), clusterthr=0.4)
##D     ## 2 direction, low croosing angle
##D     angles <- c(20,65); b <- 6000
##D     simulglyph.vmf(angles=angles,b=b)
##D     ## 3 directions
##D     angles <- c(20,80,140); b <- 3000
##D     simulglyph.vmf(angles=angles,b=b)
##D     # 3 directions
##D     angles <- c(0,60,120); b <- 3000
##D     simulglyph.vmf(angles=angles,b=b)
##D     # 3 directions, different weights
##D     simulglyph.vmf(angles=angles,b=b, wi=c(0.25,0.25,0.5), clusterthr=0.4)
##D     ##------------------
##D     ## noisy simulations and vMF estimation by GQI and QBI
##D     b <- 3000; sigma <- 0.033
##D     angles <- c(20,110)
##D     simulglyph.vmf(angles=angles,b=b, sigma=sigma, gdi="gqi")
##D     simulglyph.vmf(angles=angles,b=b, sigma=sigma, gdi="sph")
##D     # 2 direction, lower crossing-angles, higher b
##D     angles <- c(20,80)
##D     simulglyph.vmf(angles=angles,b=b, sigma=sigma)
##D     ## 2 direction, low croosing angle
##D     angles <- c(20,65)
##D     simulglyph.vmf(angles=angles,b=b, sigma=sigma)
##D     # 3 directions
##D     angles <- c(20,80,140)
##D     simulglyph.vmf(angles=angles,b=b, sigma=sigma)
##D     # 3 directions
##D     angles <- c(0,60,120)
##D     simulglyph.vmf(angles=angles,b=b, sigma=sigma)
##D     ##------------------
##D     ## speeded up approximations: hardmax and common kappa
##D     ## 2 direction, low croosing angle
##D     b <- 4000; angles <- c(20,65) 
##D     simulglyph.vmf(angles=angles,b=b, clusterthr=0.4,
##D       E="hardmax", kappa = list(common = TRUE))
##D     ## 3 directions, different weights
##D     b <- 6000; angles <- c(0,60,120)
##D     simulglyph.vmf(angles=angles,b=b, wi=c(0.25,0.25,0.5),
##D       clusterthr=0.4, E="hardmax", kappa = list(common = TRUE))
##D     ## hardmax; numeric kappa
##D     simulglyph.vmf(angles=angles,b=b, wi=c(0.25,0.25,0.5), 
##D       clusterthr=0.4, E="hardmax", kappa = 40)
## End(Not run)



