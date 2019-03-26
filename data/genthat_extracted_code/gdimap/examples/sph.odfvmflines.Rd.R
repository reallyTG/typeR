library(gdimap)


### Name: sph.odfvmflines
### Title: Fibre Orientation Mapping Based on von Mises-Fisher
###   Distributions with QBI reconstruction
### Aliases: sph.odfvmflines
### Keywords: methods clustering dplot

### ** Examples

## Not run: 
##D   ##-------------
##D   ## von Mises-Fisher fibre orientation mapping
##D   ## for a range of slices
##D   sph.odfvmflines(run=TRUE, rg=c(1,1), showimage="linesdata",
##D     threshold=0.5)
##D   ## display line-maps only
##D   sph.odfvmflines(run=FALSE, showimage="lines")
##D   ## using GFA overlay
##D   sph.odfvmflines(run=FALSE, showimage="linesgfa")
##D   ##-------------
##D   ## Show reconstructed glyphs in ODF processing 
##D   ## for principal direction determination
##D   sph.odfvmflines(run=TRUE, showimage="linesdata",
##D     showglyph=TRUE, threshold=0.5)
##D   ##-------------
##D   ## using a ROI overlay
##D   sph.odfvmflines(run=TRUE, roi="slfcst.nii.gz")
##D   ##-------------
##D   ## speeded up approximations: hardmax and common/numeric kappa
##D   sph.odfvmflines(run=TRUE, rg=c(1,1), showimage="linesdata",
##D     E="hardmax", kappa=list(common = TRUE))
##D   sph.odfvmflines(run=TRUE, rg=c(1,1), showimage="linesdata",
##D     E="hardmax", kappa=20)
## End(Not run)



