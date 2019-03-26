library(CommonTrend)


### Name: optimlag
### Title: Search the lag order to maximize Johansen Statistics (1988)
### Aliases: optimlag
### Keywords: lag

### ** Examples


data(benchmark)
x = seq(1, 6689, by = 23)  ## monthly data
global = data.frame(benchmark[x, 2:4])

optimlag(global, 15, "none")




