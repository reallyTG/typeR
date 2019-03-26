library(eseis)


### Name: signal_aggregate
### Title: Aggregate a signal vector
### Aliases: signal_aggregate
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## aggregate signal by factor 4 (i.e., dt goes from 1/200 to 1/50)
rockfall_agg <- signal_aggregate(data = rockfall_z, 
                                 n = 4)

## create example data set
s <- 1:10
  
## aggregate x by factor 2
s_agg_2 <- signal_aggregate(data = s,
                            n = 2)
                              
## aggregate x by factor 3
s_agg_3 <- signal_aggregate(data = s, 
                            n = 3)
                              
## plot results
plot(x = s,
     y = rep(x = 1, times = length(s)),
     ylim = c(1, 3))
     
points(x = s_agg_2, 
       y = rep(x = 2, times = length(s_agg_2)), 
       col = 2)

points(x = s_agg_3, 
       y = rep(x = 3, times = length(s_agg_3)), 
       col = 3)
       
abline(v = s_agg_2,
       col = 2)

abline(v = s_agg_3, 
       col = 3)
       
## create signal matrix
X <- rbind(1:100, 1001:1100, 10001:10100)

## aggregate signal matrix by factor 4
X_agg <- signal_aggregate(data = X, 
n = 4)




