library(tkrgl)


### Name: spin3d
### Title: Create TCL/TK controller for rgl window
### Aliases: spin3d
### Keywords: dynamic

### ** Examples

if (interactive()) {
    library(rgl)
    open3d()
    rgl.bringtotop(TRUE)
    points3d(rnorm(100), rnorm(100), rnorm(100), size=3)
    axes3d()
    box3d()
    tkrgl::spin3d()  # rgl also has a function called spin3d!
}



