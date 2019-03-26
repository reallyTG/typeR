library(pedquant)


### Name: pq_addti
### Title: adding technical indicators
### Aliases: pq_addti

### ** Examples

## No test: 
# load data
dt = md_stock("^000001", source='163', date_range = 'max')

# add technical indicators
dt_ti1 = pq_addti(dt, sma=list(n=20), sma=list(n=50), macd = list())

# only technical indicators
dt_ti2 = pq_addti(dt, sma=list(n=20), sma=list(n=50), macd = list(), col_kp = FALSE)
## End(No test)




