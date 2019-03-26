library(evt0)


### Name: DPOT
### Title: Duration based peaks over threshold value-at-risk forecast
### Aliases: DPOT
### Keywords: DPOT VaR

### ** Examples

#Read S&P500 from data file
data(S_P500)
str(S_P500)

# One day ahead VaR forecast
DPOT(S_P500$returns,0.01,0.75,0.1,1000)



