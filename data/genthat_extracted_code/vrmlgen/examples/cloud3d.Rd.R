library(vrmlgen)


### Name: cloud3d
### Title: Draw a 3D scatter plot
### Aliases: cloud3d
### Keywords: utilities misc

### ** Examples



curdir <- getwd()
outdir <- tempdir()
setwd(outdir)


# example 1: visualize random 3D input data
mat <- matrix(runif(99, 0, 3), ncol = 3)

# create random class assignment vector with three classes
y <- round(runif(33, 0, 2))
y <- ifelse(y == 0, "class 1", ifelse(y == 1, "class 2", "class 3"))

# create ouput using numbers from 1 to length(y) as metalabels
cloud3d(mat, labels = y, metalabels = 1:length(y), col.axis = "black",
        col.lab = "blue", col.bg = "white", type = "vrml",
        filename = "result.wrl", htmlout = "result.html")

# show the output in a web-browser 
# (VRML-plugin must be installed!)
if(file.exists(paste("file://",file.path(outdir,
                "result.html"), sep = "")))
{
  browseURL(paste("file://",file.path(outdir,
                  "result.html"), sep = ""))
}


# example 2: visualization of Edgar Anderson's Iris data
# using density estimation contour surfaces (requires misc3-package!)
irismat <- iris[,1:3]
cloud3d(irismat, labels = iris[,5], vrml_showdensity = TRUE,
        col.axis = "blue", col.lab = "black", lab.axis = colnames(irismat),
        type = "vrml", filename = "result2.wrl", htmlout = "iris.html")

# show the output in a web-browser 
# (VRML-plugin must be installed!)
if(file.exists(paste("file://",file.path(outdir,
                "iris.html"), sep = "")))
{
  browseURL(paste("file://",file.path(outdir,
                  "iris.html"), sep = ""))
}
 
setwd(curdir)




