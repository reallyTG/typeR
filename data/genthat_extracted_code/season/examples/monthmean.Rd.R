library(season)


### Name: monthmean
### Title: Monthly Means
### Aliases: monthmean

### ** Examples
## No test: 
# cardiovascular disease data
data(CVD)
mmean = monthmean(data=CVD, resp='cvd', offsetpop=expression(pop/100000), adjmonth='average')
mmean
plot(mmean)
## End(No test)



