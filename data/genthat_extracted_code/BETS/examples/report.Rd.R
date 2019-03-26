library(BETS)


### Name: report
### Title: Create dynamic reports with a full analysis of a set of time
###   series
### Aliases: report

### ** Examples

##-- SARIMA

# parameters = list(lag.max = 48, n.ahead = 12 ) 
# report(ts = 21864, parameters = parameters)

# report(ts = 4447, series.saveas = "csv")

# series = list(BETSget(4447), BETSget(21864))
# parameters = list(lag.max = 20, n.ahead = 15 ) 
# report(ts = series, parameters = parameters)

# series = list(4447, 21864)
# report(ts = series, parameters = parameters)

# parameters = list( 
# cf.lags = 25,
# n.ahead = 15,
# dummy = dum,
# arch.test = list(lags = 12, alpha = 0.01),
# box.test = list(type = "Box-Pierce")
# )
# report(ts = window(BETSget(21864), start= c(2002,1) , end = c(2015,10)), 
#parameters = parameters)

# dum <- dummy(start= c(2002,1) , end = c(2017,1) , 
#from = c(2008,9) , to = c(2008,11))

# parameters = list( 
#    cf.lags = 25,
#    n.ahead = 15,
#    dummy = dum
# )

# report(ts = window(BETSget(21864), start= c(2002,1) , end = c(2015,10)), 
#parameters = parameters)


##-- GRNN

# params = list(regs = 4382)
# report(mode = "GRNN", ts = 13522, parameters = params)

##-- HOLT-WINTERS

# params = list(alpha = 0.5, gamma = TRUE)
# report(mode = "HOLT-WINTERS", ts = 21864, series.saveas = "csv", parameters = params)

# params = list(gamma = T, beta = TRUE)
# report(mode = "HOLT-WINTERS", ts = 21864, series.saveas = "csv", parameters = params)




