library(PRISM.forecast)


### Name: prism
### Title: PRISM function
### Aliases: prism

### ** Examples

prism_data = load_5y_search_data('0610')
data = prism_data$claim.data[1:200] # load claim data from 2006-01-07 to 2009-10-31
data[200] = NA # delete the data for the latest date and try to nowcast it.

data.early = prism_data$claim.earlyData # load claim prior to 2006
GTdata = prism_data$allSearch[1:200] # load Google trend data from 2006-01-07 to 2009-10-31

result = prism(data, data.early, GTdata) # call prism method
result$pred # output 0-3wk forward prediction




