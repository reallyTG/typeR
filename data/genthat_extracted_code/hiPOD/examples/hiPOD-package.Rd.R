library(hiPOD)


### Name: hiPOD-package
### Title: hierarchial Pooled Optimal Design
### Aliases: hiPOD-package hiPOD
### Keywords: package

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
PlotOptPower(example.1, save.contour=TRUE, contour.filename=paste(proj.Dir, "/example1_contour.bmp",sep=""))

# # snapshot3d(filename = paste(proj.Dir, "/example1_3d.bmp", sep=""))
ShowOptDesign(example.1, 5)
write.csv(ShowOptDesign(example.1), paste(proj.Dir, "/example1.csv", sep=""))






# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
######## Example 2: A realist example comparing with individual sequencing with 200 individuals 4X each
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

##### Find the optimal design
example.2 <- FindOptPower(cost=452915, sample.size=5000, MAF=0.03, OR=2, error=0.01)

##### assign a directory to store the contour plots
##### with your own choice
proj.Dir <- paste(getwd(), "/hiPOD_examples", sep="")
if(!file.exists(proj.Dir)) dir.create(proj.Dir)

##### Inferences on the optimal designs
PlotOptPower(example.2, save.contour=TRUE, contour.filename=paste(proj.Dir, "/example2_contour.bmp",sep=""))

# # snapshot3d(filename = paste(proj.Dir, "/example2_3d.bmp", sep=""))

ShowOptDesign(example.2)
write.csv(ShowOptDesign(example.2), paste(proj.Dir, "/example2.csv", sep=""))



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ######## Example 3: comparing with individual sequencing with 200 individuals 4X each
# ######## Now varying the CostPerX with other parameters fixed
# ######## NOTE::: It might take a long time as 6 design questions are investigated
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# #### specify the cost function
# CostPerExp.3 <- 10000
# CostPerPool.3 <- 1000
# CostPerX.3.range <- c(50,100,200,300,400,500)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# ##### assign a directory to store the contour plots
# ##### with your own choice
# proj.Dir <- paste(getwd(), "/hiPOD_examples", sep="")
# if(!file.exists(proj.Dir)) dir.create(proj.Dir)

# top.choices.3 <- data.frame()
# for(CostPerX.3 in CostPerX.3.range)
# {
	# cost.3 <- CostPerExp.3 + CostPerPool.3*200 + CostPerX.3*200*4

	# ##### Find the optimal design
	# example.3 <- FindOptPower(cost=cost.3, sample.size=5000, MAF=0.03, OR=2, error=0.01, costPerExp=CostPerExp.3, costPerPool=CostPerPool.3, costPerX=CostPerX.3)

	# ##### Inferences on the optimal designs
	# PlotOptPower(example.3, save.contour=TRUE, contour.filename=paste(proj.Dir, "/example3_contour_CostPerX=", CostPerX.3,".bmp",sep=""))

	# temp <- ShowOptDesign(example.3, 10)
	# temp <- cbind(CostPerX.3, temp)
	# top.choices.3 <- rbind(top.choices.3, temp)
# }
# write.csv(top.choices.3, paste(proj.Dir, "/example3.csv", sep=""))





