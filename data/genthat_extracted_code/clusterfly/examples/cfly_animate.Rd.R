library(clusterfly)


### Name: cfly_animate
### Title: Dynamic plot: Animate glyph colours
### Aliases: cfly_animate
### Keywords: dynamic

### ** Examples

# Press Ctrl-Break or Ctrl-C to exit
if (interactive()) {
o <- olive_example()
cfly_animate(cfly_clarify(o), max = 5)
close(o)
}



