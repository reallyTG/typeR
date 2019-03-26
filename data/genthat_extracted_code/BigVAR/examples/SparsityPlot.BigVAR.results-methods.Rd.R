library(BigVAR)


### Name: SparsityPlot.BigVAR.results
### Title: Sparsity Plot of a BigVAR.results object
### Aliases: SparsityPlot.BigVAR.results
###   SparsityPlot.BigVAR.results,BigVAR.results-method

### ** Examples

data(Y)
Y <- Y[1:100,]
Model1 <- constructModel(Y,p=4,struct="Basic",gran=c(50,10),verbose=FALSE)
SparsityPlot.BigVAR.results(cv.BigVAR(Model1))



