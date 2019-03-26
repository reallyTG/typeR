library(murphydiagram)


### Name: Fluctuation Test
### Title: Fluctuation test
### Aliases: fluctuation_test
### Keywords: forecasting methods

### ** Examples


# Comparison of Inflation Forecasts: 
# Survey of  Professional Forecasters (SPF) 
# versus Michigan Survey of Consumers

data(inflation_mean)

# Compute extremal scores of SPF/Michigan (theta = 3)
score_spf <- extremal_score(x = inflation_mean$spf, 
                            y = inflation_mean$rlz, theta = 3)
score_michigan <- extremal_score(x = inflation_mean$michigan, 
                                 y = inflation_mean$rlz, theta = 3)

# Make simplified label for time axis
tml <- as.numeric(substr(inflation_mean$dt, 1, 4))

# Fluctuation test
fluct_test <- fluctuation_test(score_spf, score_michigan, 
                               time_labels = tml, lag_truncate = 4)




