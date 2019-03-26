library(CluMP)


### Name: OptiNum
### Title: Finding an optimal number of clusters
### Aliases: OptiNum
### Keywords: CluMP

### ** Examples

data <- GeneratePanel(n = 100, Param = ParamLinear, NbVisit = 10)
OptiNum(data = data, formula = Y ~ Time, group = "ID")




