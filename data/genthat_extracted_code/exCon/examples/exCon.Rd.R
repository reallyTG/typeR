library(exCon)


### Name: exCon
### Title: Explore Contour Data Interactively
### Aliases: exCon exCon2 exCon2
### Keywords: interactive plot

### ** Examples

if (interactive()) {
require(jsonlite)

# minify is FALSE in the examples as not all platforms support the required pkgs (see above)

exCon(M = volcano, minify = FALSE)

exCon2(M = volcano, minify = FALSE) # no slices

# This next example will label the axes with the actual values, relative to the
# lower left corner (original data collected on 10 meter grid).  Giving
# x and y affects only the scale, and the native values displayed at the top.

 exCon(M = volcano, minify = FALSE,
 x = seq(from = 0, by = 10, length.out = nrow(volcano)),
 y = seq(from = 0, by = 10, length.out = ncol(volcano)))
}




