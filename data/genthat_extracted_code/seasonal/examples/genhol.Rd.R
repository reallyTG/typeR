library(seasonal)


### Name: genhol
### Title: Generate Holiday Regression Variables
### Aliases: genhol

### ** Examples


## Not run: 
##D 
##D data(holiday)  # dates of Chinese New Year, Indian Diwali and Easter
##D 
##D ### use of genhol
##D 
##D # 10 day before Easter day to one day after, quarterly data:
##D genhol(easter, start = -10, end = 1, frequency = 4) 
##D genhol(easter, frequency = 2)  # easter is allways in the first half-year
##D 
##D # centering for overall mean or monthly calendar means
##D genhol(easter, center = "mean") 
##D genhol(easter, center = "calendar") 
##D 
##D ### replicating X-13's built-in Easter adjustment
##D 
##D # built-in
##D m1 <- seas(x = AirPassengers,
##D regression.variables = c("td1coef", "easter[1]", "ao1951.May"),
##D arima.model = "(0 1 1)(0 1 1)", regression.aictest = NULL,
##D outlier = NULL, transform.function = "log", x11 = "")
##D summary(m1)
##D 
##D # user defined variable
##D ea1 <- genhol(easter, start = -1, end = -1, center = "calendar")
##D 
##D # regression.usertype = "holiday" ensures that the effect is removed from 
##D # the final series.
##D m2 <- seas(x = AirPassengers,
##D            regression.variables = c("td1coef", "ao1951.May"),
##D            xreg = ea1, regression.usertype = "holiday",
##D            arima.model = "(0 1 1)(0 1 1)", regression.aictest = NULL,
##D            outlier = NULL, transform.function = "log", x11 = "")
##D summary(m2)
##D 
##D all.equal(final(m2), final(m1), tolerance = 1e-06)
##D 
##D 
##D # with genhol, its possible to do sligtly better, by adjusting the length
##D # of easter from Friday to Monday:
##D 
##D ea2 <- genhol(easter, start = -2, end = +1, center = "calendar")
##D m3 <- seas(x = AirPassengers, 
##D            regression.variables = c("td1coef", "ao1951.May"), 
##D            xreg = ea2, regression.usertype = "holiday",
##D            arima.model = "(0 1 1)(0 1 1)", regression.aictest = NULL, 
##D            outlier = NULL, transform.function = "log", x11 = "")
##D summary(m3)
##D 
##D 
##D ### Chinese New Year
##D 
##D data(seasonal) 
##D data(holiday)  # dates of Chinese New Year, Indian Diwali and Easter
##D 
##D # de facto holiday length: http://en.wikipedia.org/wiki/Chinese_New_Year
##D cny.ts <- genhol(cny, start = 0, end = 6, center = "calendar")
##D 
##D m1 <- seas(x = imp, xreg = cny.ts, regression.usertype = "holiday", x11 = "", 
##D            regression.variables = c("td1coef", "ls1985.Jan", "ls2008.Nov"), 
##D            arima.model = "(0 1 2)(0 1 1)", regression.aictest = NULL, 
##D            outlier = NULL, transform.function = "log")
##D summary(m1)
##D 
##D # compare to identical no-CNY model
##D m2 <- seas(x = imp, x11 = "", 
##D            regression.variables = c("td1coef", "ls1985.Jan", "ls2008.Nov"), 
##D            arima.model = "(0 1 2)(0 1 1)", regression.aictest = NULL, 
##D            outlier = NULL, transform.function = "log")
##D summary(m2)
##D 
##D ts.plot(final(m1), final(m2), col = c("red", "black"))
##D 
##D # modeling complex holiday effects in Chinese imports
##D # - positive pre-CNY effect
##D # - negative post-CNY effect
##D pre_cny <- genhol(cny, start = -6, end = -1, frequency = 12, center = "calendar")
##D post_cny <- genhol(cny, start = 0, end = 6, frequency = 12, center = "calendar")
##D m3 <- seas(x = imp, x11 = "",
##D            xreg = cbind(pre_cny, post_cny), regression.usertype = "holiday", 
##D            x11 = list())
##D summary(m3) 
##D 
##D 
##D ### Indian Diwali (thanks to Pinaki Mukherjee)
##D 
##D # adjusting Indian industrial production
##D m4 <- seas(iip, 
##D x11 = "",
##D xreg = genhol(diwali, start = 0, end = 0, center = "calendar"), 
##D regression.usertype = "holiday"
##D ) 
##D summary(m4)
##D 
##D # without specification of 'regression.usertype', Diwali effects are added 
##D # back to the final series
##D m5 <- seas(iip, 
##D x11 = "",
##D xreg = genhol(diwali, start = 0, end = 0, center = "calendar")
##D ) 
##D 
##D ts.plot(final(m4), final(m5), col = c("red", "black"))
##D 
##D # plot the Diwali factor in Indian industrial production
##D plot(series(m4, "regression.holiday"))
##D 
##D 
##D ### Using genhol to replicate the regARIMA estimation in R
##D 
##D # easter regressor
##D ea <- genhol(easter, start = -1, end = -1, center = "calendar")
##D ea <- window(ea, start = start(AirPassengers), end = end(AirPassengers))
##D 
##D # estimating ARIMA model in R base
##D arima(log(AirPassengers), order = c(0,1,1), seasonal = c(0,1,1), xreg = ea)
##D     
##D summary(seas(AirPassengers, regression.variables = c("easter[1]"), 
##D              regression.aictest = NULL))
##D 
##D # Note that R defines the ARIMA model with negative signs before the MA term,
##D # X-13 with a positive sign.
## End(Not run)



