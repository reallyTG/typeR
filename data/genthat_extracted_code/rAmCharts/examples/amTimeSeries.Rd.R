library(rAmCharts)


### Name: amTimeSeries
### Title: Plotting times series (with or without aggregation)
### Aliases: amTimeSeries

### ** Examples

data("data_stock_2")
amTimeSeries(data_stock_2, "date", c("ts1", "ts2"))

## Not run: 
##D # upper /lower
##D data <- data_stock_2[1:50, ]
##D data$ts1low <- data$ts1-100
##D data$ts1up <- data$ts1+100
##D 
##D amTimeSeries(data, "date", list(c("ts1low", "ts1", "ts1up"), "ts2"))
##D amTimeSeries(data, "date", list(c("ts1low", "ts1", "ts1up"), "ts2"), 
##D  color = c("red", "blue"), bullet = c("round", "square"))
##D 
##D 
##D amTimeSeries(data_stock_2, "date", c("ts1", "ts2"), bullet = "round")
##D amTimeSeries(data_stock_2, "date", c("ts1", "ts2"), bullet = "round",
##D               groupToPeriods = c('hh', 'DD', '10DD'))
##D 
##D amTimeSeries(data_stock_2, "date", c("ts1", "ts2"), bullet = "round",
##D               groupToPeriods = c('12hh', 'DD', '10DD'),
##D               maxSeries = 50)
##D               
##D amTimeSeries(data_stock_2, "date", c("ts1", "ts2"), bullet = "round",
##D              groupToPeriods = c('hh', 'DD', '10DD'),
##D              linewidth = c(3, 1))
##D              
##D amTimeSeries(data_stock_2, "date", c("ts1", "ts2"), aggregation = "Sum")
##D 
##D 
##D amTimeSeries(data_stock_2, "date", c("ts1", "ts2"), bullet = "round",
##D               groupToPeriods = c('12hh', 'DD', '10DD'),
##D               maxSeries = 50, precision = 5)
##D 
##D amTimeSeries(data_stock_2, "date", c("ts1", "ts2"), bullet =  c("diamond", "square"),
##D              linetype = 0, bulletSize = c(5, 10),
##D              groupToPeriods = c('12hh', 'DD', '10DD'),
##D              maxSeries = 50, aggregation = "Sum")
##D 
##D 
##D ZoomButton <- data.frame(Unit = c("DD", "DD", "MAX"), multiple = c(1, 2 ,1),
##D                         label = c("Day","2 days", "MAX"))
##D amTimeSeries(data_stock_2, "date", c("ts1", "ts2"), bullet = "round",
##D              ZoomButton = ZoomButton, main = "My title", ylab = "Interest")
##D              
##D amTimeSeries(data_stock_2, "date", c("ts1", "ts2"), bullet = "round",
##D              ZoomButton = ZoomButton, main = "My title", ylab = "Interest",
##D              export = TRUE, ZoomButtonPosition = "right",
##D              legendPosition = "bottom", scrollbarPosition = "top")
##D          
##D amTimeSeries(data_stock_2, "date", c("ts1", "ts2"), bullet = "round",
##D              ZoomButton = ZoomButton, main = "My title",
##D              ylab = "Interest", export = TRUE,
##D              creditsPosition = "bottom-left")
##D              
## End(Not run)




