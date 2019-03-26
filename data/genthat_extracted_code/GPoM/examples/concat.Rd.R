library(GPoM)


### Name: concat
### Title: Concat Concatenates separated time series
### Aliases: concat

### ** Examples

# load data
data("svrlTS")
# Concatenate the data set into a single time series
winL = 55
concaTS <- concat(svrlTS, winL = winL)
# Plot the concatenated time series
plot(concaTS$sglTS$TS[,1], concaTS$sglTS$TS[,2],
     main = 'Concatenated time series',
     xlab = 'Time (concatenated)', ylab = 'y(t)',
     type = 'l', col = 'gray')
lines(concaTS$sglTS$TS[concaTS$sglTS$W == 1,1],
      concaTS$sglTS$TS[concaTS$sglTS$W == 1,2], type = 'p', col = 'green', cex = 0.5)
lines(concaTS$sglTS$TS[concaTS$sglTS$W == 0,1],
      concaTS$sglTS$TS[concaTS$sglTS$W == 0,2], type = 'p', col = 'red', cex = 0.5)
lines(concaTS$sglTS$TS[,1], concaTS$sglTS$W, type = 'l')
## Not run: 
##D # The concatenated data set can be used for global modelling:
##D GPout1 <- gPoMo(data = concaTS$sglTS$TS[,2], tin = concaTS$sglTS$TS[,1],
##D                 dMax = 2, nS = 3, winL = winL, weight = concaTS$sglTS$W, show = 1,
##D                 IstepMin = 10, IstepMax = 6000, nPmin = 11, nPmax = 11, method = 'rk4')
## End(Not run)




