library(hiPOD)


### Name: ShowOptDesign
### Title: Print the top choices of designs
### Aliases: ShowOptDesign
### Keywords: ~kwd1 ~kwd2

### ** Examples

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
######## Example 1: A simple example, with very rough grid points (only 20X20 grid points)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

##### Find the optimal design
example.1 <- FindOptPower(cost=700000, sample.size=5000, MAF=0.03, OR=2, error=0.01, upper.P=200, Number.Grids=50)

##### assign a directory to store the contour plots
##### with your own choice
proj.Dir <- paste(getwd(), "/hiPOD_examples", sep="")
if(!file.exists(proj.Dir)) dir.create(proj.Dir)

##### Inferences on the optimal designs
PlotOptPower(example.1, save.contour=FALSE, plot.3d=FALSE)

ShowOptDesign(example.1, 5)
ShowOptDesign(example.1, 10)





## The function is currently defined as
function(opt.design.results, num.designs=10)
{
designs.good <- subset(opt.design.results[[5]], subset=(is.valid.design & upper.sample.good & Xmean.good))
head(designs.good[order(-designs.good$pred.power), ], num.designs)
  }



