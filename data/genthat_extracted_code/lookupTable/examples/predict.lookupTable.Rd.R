library(lookupTable)


### Name: predict.lookupTable
### Title: Predictions from a look-up table
### Aliases: predict.lookupTable

### ** Examples

df.input <- cars
response <- 'dist'
feature.boundaries <- list(c(-Inf, 5, 10, 15, 20, 25, Inf))
features.con <- c('speed')
dist.table <- lookupTable(df.input, response, feature.boundaries, features.con)
df.test <- data.frame(speed = c(2, 23, 41, 5, 9, 8))
predict(dist.table, df.test)



