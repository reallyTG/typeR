library(vrmlgen)


### Name: vrmlgen-package
### Title: Create 3D data plots, charts and graphs as VRML files
### Aliases: vrmlgen-package vrmlgen
### Keywords: package

### ** Examples


curdir <- getwd()
outdir <- tempdir()
setwd(outdir)

# create 33x3 matrix with random 3D input data
mat <- matrix(runif(99, 0, 3), ncol = 3)

# create random class assignment vector with three classes
y <- round(runif(33, 0, 2))
y <- ifelse(y == 0, "class 1", ifelse(y == 1, "class 2", "class 3"))

# create ouput using numbers from 1 to length(y) as metalabels
cloud3d(mat, labels = y, metalabels = 1:length(y), col.axis = "black", col.lab = "blue",
col.bg = "white")

setwd(curdir)




