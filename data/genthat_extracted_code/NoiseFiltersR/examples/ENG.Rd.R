library(NoiseFiltersR)


### Name: ENG
### Title: Editing with Neighbor Graphs
### Aliases: ENG ENG.default ENG.formula

### ** Examples

# The example is not run because the graph construction is quite time-consuming.
## Not run: 
##D    data(iris)
##D    trainData <- iris[c(1:20,51:70,101:120),]
##D    out <- ENG(Species~Petal.Length + Petal.Width, data = trainData, graph = "RNG")
##D    print(out)
##D    identical(out$cleanData,trainData[setdiff(1:nrow(trainData),out$remIdx),])
## End(Not run)



