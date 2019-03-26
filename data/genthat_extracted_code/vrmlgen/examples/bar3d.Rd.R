library(vrmlgen)


### Name: bar3d
### Title: Draw a 3D bar chart
### Aliases: bar3d
### Keywords: utilities misc

### ** Examples


curdir <- getwd()
outdir <- tempdir()
setwd(outdir)

# Height map visualization of geographical data
# with colors corresponding to different height levels
colpalette <- terrain.colors(max(volcano)-min(volcano)+1)
cols <- colpalette[as.vector(t(volcano))-min(volcano)+1]
bar3d(volcano, col.bg = "white", cols = cols,
      type = "vrml", space = 0, showaxis = FALSE,
      filename = "volcano.wrl", htmlout = "volcano.html")

# show the output in a web-browser 
# (VRML-plugin must be installed!)
if(file.exists(paste("file://",file.path(outdir,
                "volcano.html"), sep = "")))
{
  browseURL(paste("file://",file.path(outdir,
                  "volcano.html"), sep = ""))
}     

# bar plot for a data matrix with numerical metalabels
mat <- matrix(9:1, nrow = 3)
rownames(mat) <- paste('row',1:3)
colnames(mat) <- paste('col',1:3)
bar3d(mat, space = 1, metalabels = 1:9, col.bg = "white",
      col.axis = "blue", col.lab = "black", type = "vrml",
      filename = "barplot.wrl", htmlout = "barplot.html")
      
# show the output in a web-browser 
# (VRML-plugin must be installed!)
if(file.exists(paste("file://",file.path(outdir,
                "barplot.html"), sep = "")))
{
  browseURL(paste("file://",file.path(outdir,
                  "barplot.html"), sep = ""))
}

# Height map visualization of very rough and highly
# simplified topographic data for the United Kingdom

data(uk_topo)

bar3d(uk_topo, autoscale = FALSE, cols = "blue",
     space = 0, showaxis = FALSE, filename = "uk_topo.wrl",
     htmlout = "uk_topo.html")

setwd(curdir)      




