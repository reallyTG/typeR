library(PerformanceAnalytics)


### Name: kurtosis
### Title: Kurtosis
### Aliases: kurtosis

### ** Examples


## mean -
## var -
   # Mean, Variance:
   r = rnorm(100)
   mean(r)
   var(r)

## kurtosis -
   kurtosis(r)

data(managers)
kurtosis(managers[,1:8])

data(portfolio_bacon)
print(kurtosis(portfolio_bacon[,1], method="sample")) #expected 3.03
print(kurtosis(portfolio_bacon[,1], method="sample_excess")) #expected -0.41
print(kurtosis(managers['1996'], method="sample"))
print(kurtosis(managers['1996',1], method="sample"))




