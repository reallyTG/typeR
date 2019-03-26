library(murphydiagram)


### Name: Murphy Diagrams
### Title: Murphy diagrams to visualize forecast comparisons
### Aliases: murphydiagram murphydiagram_diff
### Keywords: forecasting methods

### ** Examples


# Comparison of Inflation Forecasts: Survey of Professional Forecasters (SPF) 
# versus Michigan Survey of Consumers

data(inflation_mean)
murphydiagram(inflation_mean$spf, inflation_mean$michigan, inflation_mean$rlz, 
              labels = c("SPF", "Michigan"))
murphydiagram_diff(inflation_mean$spf, inflation_mean$michigan, inflation_mean$rlz)




