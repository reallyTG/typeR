library(rggobi)


### Name: ggobi.default
### Title: New ggobi
### Aliases: ggobi.default rggobi ggobi
### Keywords: dynamic

### ** Examples

if (interactive()) {
ggobi(ggobi_find_file("data", "flea.csv"))
ggobi(ggobi_find_file("data", "flea.xml"))
ggobi(mtcars)
mtcarsg <- ggobi_get()$mtcars
glyph_colour(mtcarsg)
glyph_colour(mtcarsg) <- ifelse(mtcarsg$cyl < 4, 1, 2)
glyph_size(mtcarsg) <- mtcarsg$cyl}


