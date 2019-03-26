library(mvbutils)


### Name: lsize
### Title: Report objects and their memory sizes
### Aliases: lsize
### Keywords: programming misc

### ** Examples

# Current workspace
lsize()
# Contrived example to show objects in a function's environment
{function(..., a, b, c) lsize( sys.frame( sys.nframe())) }()
# a, b, c are all missing; this example might break in future R versions
# ...   a   b   c
#  28  28  28  28



