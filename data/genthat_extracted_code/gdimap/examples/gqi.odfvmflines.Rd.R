library(gdimap)


### Name: gqi.odfvmflines
### Title: Fibre Orientation Mapping Based on von Mises-Fisher
###   Distributions with GQI Reconstruction
### Aliases: gqi.odfvmflines
### Keywords: methods clustering dplot

### ** Examples

## Not run: 
##D   ##-------------
##D   ## von Mises-Fisher fibre orientation mapping
##D   ## for a range of slices
##D   gqi.odfvmflines(gdi="gqi", run=TRUE, rg=c(1,1), depth=2,
##D     showimage="linesdata", threshold=0.5)
##D   gqi.odfvmflines(gdi="gqi2", run=TRUE, rg=c(1,1), depth=2,
##D     showimage="linesdata", threshold=0.5)
##D   ## display line-maps only
##D   gqi.odfvmflines(run=FALSE, depth=2, showimage="lines")
##D   ## using GFA overlay
##D   gqi.odfvmflines(run=FALSE, depth=2, showimage="linesgfa")
##D   ##-------------
##D   ## Show reconstructed glyphs in ODF processing 
##D   ## for principal direction determination
##D   gqi.odfvmflines(run=TRUE, depth=3,
##D     showimage="linesdata", showglyph=TRUE, threshold=0.5)
##D   ## show glyphs with using 'aniso' parameter 
##D   gqi.odfvmflines(run=TRUE, depth=3,
##D     showimage="linesdata", showglyph=TRUE, threshold=0.5, aniso=0.3)
##D   ##-------------
##D   ## using a ROI overlay
##D   gqi.odfvmflines(run=TRUE, depth=3, roi="slfcst.nii.gz")
##D   ##-------------
##D   ## coronal view with texture for a single slice
##D   texturefname <- file.path(tempdir(),"rgbmap.png")
##D   rgbvolmap(texture=texturefname, bg="transparent")
##D   gqi.odfvmflines(threshold=0.5, showimage="linesrgbmap",
##D     texture=texturefname)
##D   ##-------------
##D   ## speeded up approximations: hardmax and common/numeric kappa
##D   gqi.odfvmflines(gdi="gqi", run=TRUE, rg=c(1,1), depth=2,
##D     showimage="linesdata", threshold=0.5,
##D     E="hardmax", kappa=list(common = TRUE))
##D   gqi.odfvmflines(gdi="gqi", run=TRUE, rg=c(1,1), depth=2,
##D     showimage="linesdata", threshold=0.5, E="hardmax", kappa=20)
## End(Not run)



