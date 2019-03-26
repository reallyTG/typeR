library(vrmlgen)


### Name: mesh3d
### Title: Draw a 3D-mesh
### Aliases: mesh3d
### Keywords: utilities misc

### ** Examples


curdir <- getwd()
outdir <- tempdir()
setwd(outdir)

# Visualization of a parametric function
# defining the surface of 3D spiral

mesh3d(xfun = "s * cos(s) * (4 + cos(t + s))",
       yfun = "s * sin(s) * (4 + cos(t + s))",
       zfun = "s * sin(t + s)", param1 = "s",
       param2 = "t",range1 = c(0, 4 * pi),
       range2 = c(0, 2 * pi), type = "vrml",
       filename = "spiral.wrl",
       htmlout = "spiral.html")
       
# show the output in a web-browser 
# (VRML-plugin must be installed!)
if(file.exists(paste("file://",file.path(outdir,
                "spiral.html"), sep = "")))
{                
  browseURL(paste("file://",file.path(outdir,
                  "spiral.html"), sep = ""))
}

setwd(curdir)




