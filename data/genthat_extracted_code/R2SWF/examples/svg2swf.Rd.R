library(R2SWF)


### Name: svg2swf
### Title: Convert a sequence of SVG files to SWF file
### Aliases: svg2swf

### ** Examples

## Not run: 
##D if(capabilities("cairo")) {
##D   olddir = setwd(tempdir())
##D   svg("Rplot%03d.svg", onefile = FALSE)
##D   set.seed(123)
##D   x = rnorm(5)
##D   y = rnorm(5)
##D   for(i in 1:100) {
##D       plot(x <- x + 0.1 * rnorm(5), y <- y + 0.1 * rnorm(5),
##D            xlim = c(-3, 3), ylim = c(-3, 3), col = "steelblue",
##D            pch = 16, cex = 2, xlab = "x", ylab = "y")
##D   }
##D   dev.off()
##D   output = svg2swf(sprintf("Rplot%03d.svg", 1:100), interval = 0.1)
##D   swf2html(output)
##D   setwd(olddir)
##D }
## End(Not run)




