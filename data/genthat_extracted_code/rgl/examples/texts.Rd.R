library(rgl)


### Name: text3d
### Title: add text
### Aliases: rgl.texts text3d texts3d rglFonts
### Keywords: dynamic

### ** Examples

open3d()
famnum <- rep(1:4, 8)
family <- c("serif", "sans", "mono", "symbol")[famnum]
font <- rep(rep(1:4, each = 4), 2)
cex <- rep(1:2, each = 16)
text3d(font, cex, famnum, text = paste(family, font), adj = 0.5, 
       color = "blue", family = family, font = font, cex = cex)
## Not run: 
##D # These FreeType fonts are available from the Amaya project, and are not shipped
##D # with rgl.  You would normally install them to the rgl/fonts directory
##D # and use fully qualified pathnames, e.g. 
##D # system.file("fonts/FreeSerif.ttf", package = "rgl")
##D 
##D rglFonts(serif = c("FreeSerif.ttf", "FreeSerifBold.ttf", "FreeSerifItalic.ttf",
##D                  "FreeSerifBoldItalic.ttf"),
##D          sans  = c("FreeSans.ttf", "FreeSansBold.ttf", "FreeSansOblique.ttf",
##D                  "FreeSansBoldOblique.ttf"),
##D          mono  = c("FreeMono.ttf", "FreeMonoBold.ttf", "FreeMonoOblique.ttf",
##D                  "FreeMonoBoldOblique.ttf"),
##D          symbol= c("ESSTIX10.TTF", "ESSTIX12.TTF", "ESSTIX9_.TTF", 
##D                  "ESSTIX11.TTF"))
## End(Not run) 



