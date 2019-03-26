library(gdimap)


### Name: sph.odfpeaks
### Title: Main Fibre Orientation Determination via Peak Detection with
###   Q-ball Reconstruction
### Aliases: sph.odfpeaks
### Keywords: methods utilities

### ** Examples

## Not run: 
##D     ##-------------
##D     ## Generate ODF volumes (GQI volume processing) for
##D     ## range of slices using deterministic find peaks algorithm
##D     sph.odfpeaks(rg=c(1,1), bview="coronal", showglyph=FALSE)
##D     ## Show RGB maps for range of slices processed by sph.odfpeaks()
##D     rgbvolmap(fbase=tempdir())
##D     ##-------------
##D     ## Process whole volume: generate NIfTI files
##D     ##   data_gfa_sph.nii.gz and data_V1_sph.nii.gz
##D     sph.odfpeaks(rg=NULL)
##D     rgbvolmap(fbase=tempdir(), rg=NULL, bview="coronal")
##D     ##-------------
##D     ## Show reconstructed glyphs in ODF processing 
##D     ## for principal direction determination
##D     sph.odfpeaks(rg=c(1,1), bview="coronal", showglyph=TRUE)
## End(Not run)



