library(gdtools)


### Name: raster_str
### Title: Draw/preview a raster into a string
### Aliases: raster_str raster_view

### ** Examples

r <- as.raster(matrix(hcl(0, 80, seq(50, 80, 10)),
 nrow = 4, ncol = 5))
code <- raster_str(r, width = 50, height = 50)
if (interactive() && require("htmltools")) {
  raster_view(code = code)
}



