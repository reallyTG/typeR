library(manipulateWidget)


### Name: mwDate
### Title: Add a date picker to a manipulateWidget gadget
### Aliases: mwDate

### ** Examples

if (require(dygraphs) && require(xts)) {
  mydata <- xts(rnorm(365), order.by = as.Date("2017-01-01") + 0:364)

  manipulateWidget(
    dygraph(mydata) %>% dyEvent(date, "Your birthday"),
    date = mwDate("2017-03-27", label = "Your birthday date",
                  min = "2017-01-01", max = "2017-12-31")
  )
}




