library(miscset)


### Name: gghcl
### Title: HTML Colours Like ggplot2
### Aliases: gghcl
### Keywords: colour ggplot palette

### ** Examples

#

# Plot some palettes:
par(mfrow = c(3,1), mai = c(.1,.1,1,.1))
p <- matrix(1:10, 10)
image(p, col = gghcl(5), axes = FALSE, main ="gghcl(5)")
image(p, col = gghcl(10), axes = FALSE, main = "gghcl(10)")
image(p, col = gghcl(10, 1:5), axes = FALSE, main ="gghcl(10, 1:5)")
# dev.off() # to reset \code{par}

#



