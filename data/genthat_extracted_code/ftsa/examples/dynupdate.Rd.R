library(ftsa)


### Name: dynupdate
### Title: Dynamic updates via BM, OLS, RR and PLS methods
### Aliases: dynupdate
### Keywords: models

### ** Examples
  
# ElNino is an object of sliced functional time series, constructed from a univariate time series. 
# When we observe some newly arrived information in the most recent time period, this function  
# allows us to update the point and interval forecasts for the remaining time period. 
dynupdate(data = ElNino, newdata = ElNino$y[1:4,57], holdoutdata = ElNino$y[5:12,57],  	
    method = "block", interval = FALSE) 



