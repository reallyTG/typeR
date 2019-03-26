library(PerformanceAnalytics)


### Name: managers
### Title: Hypothetical Alternative Asset Manager and Benchmark Data
### Aliases: managers
### Keywords: datasets ts

### ** Examples

data(managers)

#preview the data
head(managers)

#summary period statistics
summary(managers)

#cumulative returns
tail(cumprod(1+managers),1)



