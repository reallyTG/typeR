library(gdimap)


### Name: sph.odfvmf
### Title: Fibre Orientation Estimation Based on von Mises Distributions
###   with Q-ball Reconstruction
### Aliases: sph.odfvmf
### Keywords: methods clustering

### ** Examples

## Not run: 
##D     ## Generate ODF volumes (QBI volume processing)
##D     ## for a range of slices using von Mises-Fisher clustering
##D     sph.odfvmf(showglyph=FALSE, threshold=0.5, savedir=tempdir())
##D     ## RGB maps for range of slices processed by sph.odfvmf()
##D     rgbvolmap(fbase=tempdir(), rg=c(1,4), bview="coronal")
##D     ##-------------
##D     ## Show reconstructed glyphs in ODF processing 
##D     ## for first and second main fibre direction determination
##D     sph.odfvmf(rg=c(1,1), bview="coronal", showglyph=TRUE, threshold=0.5)
## End(Not run)



