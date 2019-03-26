library(hiPOD)


### Name: FindOptPower
### Title: search for the optimal pooled design
### Aliases: FindOptPower
### Keywords: ~kwd1 ~kwd2

### ** Examples


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
######## Example 1: A simple example, with very rough grid points (only 20X20 grid points)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

##### Find the optimal design
example.1 <- FindOptPower(cost=452915, sample.size=5000, MAF=0.03, OR=2, error=0.01, upper.P=200, Number.Grids=20)

##### assign a directory to store the contour plots
##### with your own choice
proj.Dir <- paste(getwd(), "/hiPOD_examples", sep="")
if(!file.exists(proj.Dir)) dir.create(proj.Dir)

##### Inferences on the optimal designs
PlotOptPower(example.1, save.contour=FALSE, plot.3d=FALSE)
# # snapshot3d(filename = paste(proj.Dir, "/example1_3d.bmp", sep=""))
ShowOptDesign(example.1, 5)




