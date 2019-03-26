library(BETS)


### Name: BETSget
### Title: Get a complete time series from a BETS database
### Aliases: BETSget
### Keywords: get

### ** Examples


 # Anual series: GDP at constant prices, in R$ (brazilian reais)
 #BETSget(1208)
 
 # International reserves - Cash concept 
 #int.reserves <- get("3543")
 #plot(int.reserves)
 
 # Exchange rate - Free - United States dollar (purchase)
 #us.brl <- get(3691)
 
 # Multiple requests
 # BETSget(code = c(10777,4447),from = "2001-01-01", to = "2016-10-31")
 # BETSget(code = c(10777,4447),from = c("2001-10-31",""),to = c("2016-10-31",""))
 
 # f <- c("2001-10-31","1998-09-01")
 # t <- c("2014-10-31","2015-01-01")
 # BETSget(code = c(10777,4447), from = f, to = t)
 
 # BETSget(code = c(10777,4447),from = "2001-10-31", to = c("2014-10-31","2015-01-01"))
 # BETSget(code = c(10777,4447),from = c("2002-10-31","1997-01-01"), to = "2015-01-01")
 
 



