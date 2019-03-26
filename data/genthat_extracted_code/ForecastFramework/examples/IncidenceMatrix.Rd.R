library(ForecastFramework)


### Name: IncidenceMatrix
### Title: IncidenceMatrix
### Aliases: IncidenceMatrix

### ** Examples

data = IncidenceMatrix$new(matrix(1:9,3,3))
data$mat
data$nrow
data$ncol
data$colData = list(1:3,letters[1:3])
data$colData
data$addColumns(2)
data$colData
data$mat
data$diff(1)
data$mat
data$lag(1)
data$mat
data$head(1,1)
data$mat
data$tail(2,2)
data$mat
data$mutate(data=3)
data$mat
data = IncidenceMatrix$new(matrix(1:9,3,3))
data$scale(function(x){x^2},mutate=FALSE)$mat
data$mat
data$subset(rows=1,cols=2)
data$mat



