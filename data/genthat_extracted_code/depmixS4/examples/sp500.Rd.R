library(depmixS4)


### Name: sp500
### Title: Standard & Poor's 500 index
### Aliases: sp500
### Keywords: datasets

### ** Examples


data(sp500)

# the data can be made with the following code (eg to include a longer or
# shorter time span)

## Not run: 
##D 
##D require(TTR)
##D 
##D # load SP500 returns
##D Sys.setenv(tz='UTC')
##D 
##D sp500 <- getYahooData('^GSPC',start=19500101,end=20120228,freq='daily')
##D ep <- endpoints(sp500, on="months", k=1)
##D sp500 <- sp500[ep[2:(length(ep)-1)]]
##D sp500$sp500_ret <- log(sp500$Close) - lag(log(sp500$Close))
##D sp500 <- na.exclude(sp500)
##D 
## End(Not run)




