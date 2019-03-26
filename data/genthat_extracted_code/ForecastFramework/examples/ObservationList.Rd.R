library(ForecastFramework)


### Name: ObservationList
### Title: ObservationList
### Aliases: ObservationList

### ** Examples

require(dplyr)
data = ObservationList$new(data.frame(x=1:10 %% 2,y=1:10 %% 3,z=1,w=1:10))
data$frame
data$formArray('x','y',val='z',dimData = list(list('w')))
data$mat
data$rowData
data$aggregate = function(input_data){summarize_all(input_data,funs(mean(.)))}
data$mat
data$rowData



