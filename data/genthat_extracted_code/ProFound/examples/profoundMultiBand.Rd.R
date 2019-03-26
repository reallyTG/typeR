library(ProFound)


### Name: profoundMultiBand
### Title: Multi Band ProFound Photometry
### Aliases: profoundMultiBand
### Keywords: Detection Photometry

### ** Examples

## Not run: 
##D # Load images
##D GALEX_NUV=readFITS(system.file("extdata", 'GALEX_NUV.fits', package="magicaxis"))
##D VST_r=readFITS(system.file("extdata", 'VST_r.fits', package="magicaxis"))
##D VISTA_K=readFITS(system.file("extdata", 'VISTA_K.fits', package="magicaxis"))
##D 
##D # Warp to common WCS:
##D GALEX_NUV_VST=magwarp(GALEX_NUV, VST_r$hdr)
##D VISTA_K_VST=magwarp(VISTA_K, VST_r$hdr)
##D 
##D # Run profoundMultiBand on defaults:
##D multi=profoundMultiBand(inputlist=list(GALEX_NUV_VST, VST_r, VISTA_K_VST),
##D magzero=c(20.08,0,30), detectbands='r', multibands=c('NUV','r','K'))
##D 
##D # Notice the blue halo around the central sources:
##D plot(multi$pro_detect)
##D 
##D # Run profoundMultiBand with boxiters=2 (to avoid over-subtracting the sky):
##D multi=profoundMultiBand(inputlist=list(GALEX_NUV_VST, VST_r, VISTA_K_VST),
##D magzero=c(20.08,0,30), detectbands='r', multibands=c('NUV','r','K'), boxiters = 2)
##D 
##D # Looks better now:
##D plot(multi$pro_detect)
##D 
##D magplot(multi$cat_tot$mag_rt, multi$cat_col$mag_NUVc-multi$cat_col$mag_rc, ylim=c(-2,10))
##D points(multi$cat_tot$mag_rt, multi$cat_col$mag_rc-multi$cat_col$mag_Kc, col='red')
##D 
##D # Some options on passing segim:
##D 
##D multi2=profoundMultiBand(segim=multi$pro_detect$segim, inputlist=list(GALEX_NUV_VST,
##D VST_r, VISTA_K_VST), magzero=c(20.08,0,30), detectbands='r', multibands=c('NUV','r','K'),
##D iters_det = 0, boxiters=2)
##D 
##D multi3=profoundMultiBand(segim=multi$pro_detect$segim_orig, inputlist=list(GALEX_NUV_VST,
##D VST_r, VISTA_K_VST), magzero=c(20.08,0,30), detectbands='r', multibands=c('NUV','r','K'),
##D iters_det = 6, boxiters=2)
##D 
##D # multi and multi3 should create identical plots (since we are dilating the original
##D # segim_orig in the same manner), but multi2 will just be the final dilated segim without
##D # any dilations, hence the top-right is all green (segim=segim_orig). The final fluxes
##D # should be the same though for all 3 runs (left-middle, bottom-centre and bottom-right).
##D 
##D plot(multi$pro_detect)
##D plot(multi2$pro_detect)
##D plot(multi3$pro_detect)
## End(Not run)



