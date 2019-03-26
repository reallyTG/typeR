library(eseis)


### Name: time_aggregate
### Title: Aggregate a time series
### Aliases: time_aggregate
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## aggregate time series
rockfall_t_agg <- time_aggregate(data = rockfall_t, 
                          n = 2)

## compare results
range(rockfall_t)
diff(rockfall_t)

range(rockfall_t_agg)
diff(rockfall_t_agg)




