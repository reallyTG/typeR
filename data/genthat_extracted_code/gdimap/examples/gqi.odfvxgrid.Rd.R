library(gdimap)


### Name: gqi.odfvxgrid
### Title: Glyph Maps
### Aliases: gqi.odfvxgrid
### Keywords: methods dplot

### ** Examples

## Not run: 
##D   ## show glyph-map for selected slice
##D   gqi.odfvxgrid(threshold=0.5, depth=2, showimage="glyphgfa")
##D   gqi.odfvxgrid(gdi="gqi", threshold=0.5, depth=2, showimage="glyphgfa")
##D   ##----
##D   ## generate slice RGB map as texture
##D   texturefname <- file.path(tempdir(),"rgbmap.png")
##D   rgbvolmap(texture=texturefname, bg="transparent")
##D   ## coronal glyphs + RGBmap
##D   gqi.odfvxgrid(threshold=0.5, depth=2, showimage="glyphrgbmap",
##D     texture=texturefname)
## End(Not run)



