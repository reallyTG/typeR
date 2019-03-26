library(breathtestcore)


### Name: plot.breathtestfit
### Title: S3 plot method for breathtestfit
### Aliases: plot.breathtestfit

### ** Examples

data = list(
  A = simulate_breathtest_data(n_records = 6, seed = 100),
  B = simulate_breathtest_data(n_records = 4, seed = 187) 
)
# cleanup_data combines the list into a data frame
x = nls_fit(cleanup_data(data))
plot(x)



