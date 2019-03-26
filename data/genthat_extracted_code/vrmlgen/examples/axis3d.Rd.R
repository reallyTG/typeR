library(vrmlgen)


### Name: axis3d
### Title: Draw labeled coordinate axes in a 3D-scene
### Aliases: axis3d
### Keywords: utilities misc

### ** Examples



curdir <- getwd()
outdir <- tempdir()
setwd(outdir)

# start a new VRML environment
vrml.open(file = "axis_example.wrl", scale = 5,
          html.embed = "axis.html")

	# draw a coordinate system with dark blue axes
	# and dark gray axis labels
	axis3d(col.lab = "darkgray", col.axis = "darkblue")
	
	# plot random data points within the coordinate system
	# (increase point size by a factor of 2)
	mat <- matrix(runif(99, 0, 1), ncol = 3)
	points3d(mat, col = "red", scale = 2)

# close the VRML environment and write the output file
vrml.close()

# show the output in a web-browser 
# (VRML-plugin must be installed!)
if(file.exists(paste("file://",file.path(outdir,
                "axis.html"), sep = "")))
{
  browseURL(paste("file://",file.path(outdir,
                  "axis.html"), sep = ""))
}

setwd(curdir)




