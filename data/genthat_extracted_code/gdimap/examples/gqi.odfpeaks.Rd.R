library(gdimap)


### Name: gqi.odfpeaks
### Title: Main Fibre Orientation Determination via Peak Detection with GQI
###   Reconstruction
### Aliases: gqi.odfpeaks
### Keywords: methods utilities

### ** Examples

## Not run: 
##D     ##-------------
##D     ## Generate ODF volumes (GQI volume processing) for
##D     ## range of slices using deterministic find peaks algorithm
##D     gqi.odfpeaks(rg=c(1,1), bview="coronal", showglyph=FALSE)
##D     ## Show RGB maps for range of slices processed by gqi.odfpeaks()
##D     rgbvolmap(fbase=tempdir())
##D     ##-------------
##D     ## Process whole volume: generate NIfTI files
##D     ##   data_gfa_gqi.nii.gz and data_V1_gqi.nii.gz
##D     gqi.odfpeaks(rg=NULL)
##D     rgbvolmap(fbase=tempdir(), rg=NULL, bview="coronal")
##D     ##-------------
##D     ## Visualization of RBG maps based on processed volumes
##D     ## "data_gfa_gqi.nii.gz and "data_V1_gqi.nii.gz"
##D     ## (visualization compatible with the FSL/fslview tool) 
##D     rgbvolmap(rg=NULL, bview="coronal")
##D     ##-------------
##D     ## Show reconstructed glyphs in ODF processing 
##D     ## for principal direction determination
##D     gqi.odfpeaks(rg=c(1,1), bview="coronal", showglyph=TRUE, depth=3)
## End(Not run)



