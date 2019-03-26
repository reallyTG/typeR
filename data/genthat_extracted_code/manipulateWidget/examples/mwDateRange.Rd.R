library(manipulateWidget)


### Name: mwDateRange
### Title: Add a date range picker to a manipulateWidget gadget
### Aliases: mwDateRange

### ** Examples

if (require(dygraphs) && require(xts)) {
  mydata <- xts(rnorm(365), order.by = as.Date("2017-01-01") + 0:364)

  manipulateWidget(
    dygraph(mydata) %>% dyShading(from=period[1], to = period[2], color = "#CCEBD6"),
    period = mwDateRange(c("2017-03-01", "2017-04-01"),
                  min = "2017-01-01", max = "2017-12-31")
  )
}




