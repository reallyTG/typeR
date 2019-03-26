library(TestFunctions)


### Name: add_zoom
### Title: add_zoom: Zoom in on region of another function. Allows you to
###   easily change an existing function so that [0,1]^n refers to a
###   subregion of the original function
### Aliases: add_zoom

### ** Examples

banana(c(.5,.85))
add_zoom(banana, c(0,.5), c(1,1))(c(.5,.7))
add_zoom(banana, c(.2,.5), c(.8,1))(matrix(c(.5,.7),ncol=2))
ContourFunctions::cf(banana)
ContourFunctions::cf(add_zoom(banana, c(0,.5), c(1,1)))
ContourFunctions::cf(add_zoom(banana, c(.2,.5), c(.8,1)))



