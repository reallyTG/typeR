library(ForecastFramework)


### Name: SimulatedIncidenceMatrix
### Title: SimulatedIncidenceMatrix
### Aliases: SimulatedIncidenceMatrix

### ** Examples

data = IncidenceMatrix$new(matrix(1:9,3,3))
data = SimulatedIncidenceMatrix$new(data,3)
data$addError('Poisson')
data$simulations
data$sample$mat
data$mat
data$sample$mat
data$mat
data$nrow
data$ncol
data$nsim
data$dims
data$ndim
data$ndim
data$addRows(2)
data$addColumns(3)
data$simulations
data$head(2,1)
data$head(3,2)
data$simulations
data$mean()$mat
data$median()$mat
data$scale(mutate=FALSE,function(x){x+3})$mat
class(data$summarize(function(x){sum(x)}))
data$summarize(function(x){sum(x)})$mat
data$simulations



