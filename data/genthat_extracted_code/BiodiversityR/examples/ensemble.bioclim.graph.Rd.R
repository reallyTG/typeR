library(BiodiversityR)


### Name: ensemble.bioclim.graph
### Title: Graphs of bioclimatic ranges of species and climates
### Aliases: ensemble.bioclim.graph ensemble.bioclim.graph.data

### ** Examples

## Not run: 
##D 
##D # get predictor variables
##D library(dismo)
##D predictor.files <- list.files(path=paste(system.file(package="dismo"), '/ex', sep=''),
##D     pattern='grd', full.names=TRUE)
##D predictors <- stack(predictor.files)
##D # subset based on Variance Inflation Factors
##D predictors <- subset(predictors, subset=c("bio5", "bio6", 
##D     "bio16", "bio17", "biome"))
##D predictors
##D predictors@title <- "base"
##D 
##D # presence points
##D presence_file <- paste(system.file(package="dismo"), '/ex/bradypus.csv', sep='')
##D pres <- read.table(presence_file, header=TRUE, sep=',')[,-1]
##D 
##D # climates for north and south (use same process for future climates)
##D ext2 <- extent(-90, -32, 0, 23)
##D predictors2 <- crop(predictors, y=ext2)
##D predictors2 <- stack(predictors2)
##D predictors2@title <- "north"
##D 
##D ext3 <- extent(-90, -32, -33, 0)
##D predictors3 <- crop(predictors, y=ext3)
##D predictors3 <- stack(predictors3)
##D predictors3@title <- "south"
##D 
##D graph.data1 <- ensemble.bioclim.graph.data(predictors, p=pres, 
##D     factors="biome", species.climate.name="Bradypus")
##D graph.data2 <- ensemble.bioclim.graph.data(predictors, p=NULL, 
##D     factors="biome", species.climate.name="baseline")
##D graph.data3 <- ensemble.bioclim.graph.data(predictors2, p=NULL, 
##D     factors="biome", species.climate.name="north")
##D graph.data4 <- ensemble.bioclim.graph.data(predictors3, p=NULL, 
##D     factors="biome", species.climate.name="south")
##D graph.data.all <- rbind(graph.data1, graph.data2, graph.data3, graph.data4)
##D 
##D par.old <- graphics::par(no.readonly=T)
##D graphics::par(mfrow=c(2, 2))
##D 
##D ensemble.bioclim.graph(graph.data.all, focal.var="bio5", 
##D     var.multiply=0.1, cols=c("black", rep("blue", 3)))
##D ensemble.bioclim.graph(graph.data.all, focal.var="bio6", 
##D     var.multiply=0.1, cols=c("black", rep("blue", 3)))
##D ensemble.bioclim.graph(graph.data.all, focal.var="bio16", 
##D     var.multiply=1.0, cols=c("black", rep("blue", 3)))
##D ensemble.bioclim.graph(graph.data.all, focal.var="bio17", 
##D     var.multiply=1.0, cols=c("black", rep("blue", 3)))
##D 
##D graphics::par(par.old)
##D 
## End(Not run)



