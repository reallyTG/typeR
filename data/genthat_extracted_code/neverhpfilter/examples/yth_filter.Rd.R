library(neverhpfilter)


### Name: yth_filter
### Title: Filtered xts object
### Aliases: yth_filter

### ** Examples

data(GDPC1)

gdp_filter <- yth_filter(100*log(GDPC1), h = 8, p = 4)

knitr::kable(head(gdp_filter, 15), align = 'l')

#---------------------------------------------------------------------------#

data(PAYEMS)

log_Employment <- 100*log(xts::to.quarterly(PAYEMS["1947/2016-6"], OHLC = FALSE))

employ_trend <- yth_filter(log_Employment, h = 8, p = 4, output = c("x", "trend"))

plot(employ_trend, grid.col = "white", legend.loc = "topleft", 
         main = "Log of Employment and trend")

#----------------------------------------------------------------------------#

quarterly_data <- 100*log(merge(GDPC1, PCECC96, GPDIC1, EXPGSC1, IMPGSC1, GCEC1, GDPDEF))

cycle <- do.call(merge, lapply(quarterly_data, yth_filter, output = "cycle"))
random <- do.call(merge, lapply(quarterly_data, yth_filter, output = "random"))

cycle.sd <- t(data.frame(lapply(cycle, sd, na.rm = TRUE)))
GDP.cor <- t(data.frame(lapply(cycle, cor, cycle[,1], use = "complete.obs")))
random.sd <- t(data.frame(lapply(random, sd, na.rm = TRUE)))
random.cor <- t(data.frame(lapply(random, cor, random[,1], use = "complete.obs")))

my_table_2 <- round(data.frame(cbind(cycle.sd, GDP.cor, random.sd, random.cor)), 2)

knitr::kable(my_table_2, align = 'l')



