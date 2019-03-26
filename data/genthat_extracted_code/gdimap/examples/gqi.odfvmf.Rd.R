library(gdimap)


### Name: gqi.odfvmf
### Title: Fibre Orientation Estimation Based on von Mises Distributions
###   with GQI Reconstruction
### Aliases: gqi.odfvmf
### Keywords: methods clustering

### ** Examples

## Not run: 
##D     ## Generate ODF volumes (GQI volume processing)
##D     ## for a range of slices using von Mises-Fisher clustering
##D     gqi.odfvmf(depth=2, showglyph=FALSE, threshold=0.5, savedir=tempdir())
##D     ## RGB maps for range of slices processed by gqi.odfvmf()
##D     rgbvolmap(fbase=tempdir(), rg=c(1,4), bview="coronal")
##D     ##-------------
##D     ## Show reconstructed glyphs in ODF processing 
##D     ## for first and second main fibre direction determination
##D     gqi.odfvmf(gdi="gqi", rg=c(1,1), bview="coronal", depth=3,
##D       showglyph=TRUE, threshold=0.5)
##D     gqi.odfvmf(gdi="gqi2", rg=c(1,1), bview="coronal", depth=3,
##D       showglyph=TRUE, threshold=0.5)
##D     ##-------------
##D     ## speeded up approximations: hardmax and numeric kappa
##D     gqi.odfvmf(depth=2, showglyph=FALSE, threshold=0.5, savedir=tempdir(),
##D       E="hardmax", kappa=20)
##D     rgbvolmap(fbase=tempdir(), rg=c(1,4), bview="coronal")
## End(Not run)



