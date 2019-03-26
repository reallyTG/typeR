## ---- message = FALSE, warning = FALSE-----------------------------------
library(xts)
library(knitr)
library(neverhpfilter)

## ---- message = FALSE, warning = FALSE-----------------------------------
data(GDPC1)

gdp_filter <- yth_filter(100*log(GDPC1), h = 8, p = 4)

kable(head(data.frame(Date=index(gdp_filter), coredata(gdp_filter)), 15), align = 'l')

## ---- message = FALSE, warning = FALSE-----------------------------------
data(PAYEMS)
log_Employment <- 100*log(xts::to.quarterly(PAYEMS["1947/2016-6"], OHLC = FALSE))

employ_trend <- yth_filter(log_Employment, h = 8, p = 4, output = c("x", "trend"), family = gaussian)

plot.xts(employ_trend, grid.col = "white", legend.loc = "topleft", main = "Log of Employment and trend")

## ---- warning = FALSE----------------------------------------------------
employ_cycle <- yth_filter(log_Employment, h = 8, p = 4, output = c("cycle", "random"), family = gaussian)

plot.xts(employ_cycle, grid.col = "white", legend.loc = "topright", main="Log of Employment cycle and random")
abline(h=0)

## ---- message=FALSE, warning=FALSE---------------------------------------
fig6_data <- 100*log(merge(GDPC1, EXPGSC1, PCECC96, IMPGSC1, GPDIC1, GCEC1)["1947/2016-3"])

fig6_wrapper <- function(x, ...) {
               cycle <-  yth_filter(x, h = 8, p = 4, output = c("cycle", "random"), family = gaussian)
               plot.xts(cycle, grid.col = "white", lwd=1, main = names(x))
}

## ---- warning=FALSE, message=FALSE, eval=FALSE---------------------------
#  par(mfrow=c(3,2))
#  lapply(fig6_data, fig6_wrapper)

## ---- echo=FALSE,results='hide',fig.keep='all'---------------------------
par(mfrow=c(3,2))
lapply(fig6_data, fig6_wrapper)

## ---- eval=FALSE---------------------------------------------------------
#  data("Hamilton_table_2")
#  ?Hamilton_table_2

## ------------------------------------------------------------------------
kable(Hamilton_table_2[-NROW(Hamilton_table_2),], align = 'l', caption = "Hamilton's results: table 2, pg. 40")

## ---- warning = FALSE, message = FALSE-----------------------------------
quarterly_data <- 100*log(merge(GDPC1, PCECC96, GPDIC1, EXPGSC1, IMPGSC1, GCEC1, GDPDEF)["1947/2016-3"])

## ---- warning = FALSE, message = FALSE-----------------------------------
monthly_data <- merge(100*log(PAYEMS), 100*log(SP500$SP500)["1950/"], UNRATENSA, GS10, FEDFUNDS)

to_quarterly_data <- do.call(merge, lapply(monthly_data, to.quarterly, OHLC = FALSE))["1947/2016-6"]

quarterly_data <- merge(quarterly_data, to_quarterly_data)

## ---- warning = FALSE, message = FALSE-----------------------------------
cycle <- do.call(merge, lapply(quarterly_data, yth_filter, output = "cycle"))

random <- do.call(merge, lapply(quarterly_data, yth_filter, output = "random"))

## ---- warning = FALSE, message = FALSE-----------------------------------
cycle.sd <- t(data.frame(lapply(cycle, sd, na.rm = TRUE)))
GDP.cor <- t(data.frame(lapply(cycle, cor, cycle[,1], use = "complete.obs")))
random.sd <- t(data.frame(lapply(random, sd, na.rm = TRUE)))
random.cor <- t(data.frame(lapply(random, cor, random[,1], use = "complete.obs")))

my_table_2 <- round(data.frame(cbind(cycle.sd, GDP.cor, random.sd, random.cor)), 2)

## ---- warning = FALSE, message = FALSE-----------------------------------
sample_range <- function(x) {
  x <- na.omit(x)
  gsub(" ", "-", paste0(index(x[1,]), "/", index(x[NROW(x),])))
}

data_sample <- t(data.frame(lapply(quarterly_data, sample_range)))

my_table_2 <- cbind(my_table_2, data_sample)
names(my_table_2) <- names(Hamilton_table_2)

## ---- warning = FALSE, message = FALSE, caption = "Comparison table: Hamilton vs neverhpfilter"----
 # Combined table
combined_table <- rbind(Hamilton_table_2[-NROW(Hamilton_table_2),], my_table_2)
combined_table <- combined_table[order(combined_table$cycle.sd),]
kable(combined_table, align = 'l', caption = "Hamilton's table 2 compared with estimates from neverhpfilter::yth_filter, sorted by standard deviation of the cycle component. yth_filter estimates are labeled with the suffix '.cycle'")

