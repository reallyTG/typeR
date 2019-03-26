library(gdimap)


### Name: gqi.odfpeaklines
### Title: Fibre Orientation Mapping Based on Local Peak Detection
### Aliases: gqi.odfpeaklines
### Keywords: methods dplot utilities

### ** Examples

## Not run: 
##D   ##-------------
##D   ## Line map using ODF peak detection 
##D   gqi.odfpeaklines(run=TRUE, showimage="lines")
##D   ## idem with "gqi2"
##D   gqi.odfpeaklines(gdi="gqi2", run=TRUE, showimage="lines")
##D   ## display line-map overlayed on GFA map 
##D   gqi.odfpeaklines(run=FALSE, showimage="linesgfa")
##D   ##-------------
##D   ## generate slice texture first from default data file
##D   texturefname <- file.path(tempdir(),"rgbmap.png")
##D   rgbvolmap(texture=texturefname, bg="transparent")
##D   ## Line map with RGB map overlay
##D   gqi.odfpeaklines(run=TRUE, showimage="linesrgbmap",
##D     texture=texturefname)
##D   ##-------------
##D   ## Show examples of reconstructed glyphs in ODF processing 
##D   gqi.odfpeaklines(showimage="lines", showglyph=TRUE)
##D   ##------------
##D   ## using a ROI overlay
##D   gqi.odfpeaklines(roi="slfcst.nii.gz", showimage="linesgfa")
##D   ## using data overlay
##D   gqi.odfpeaklines(showimage="linesdata")
## End(Not run)



