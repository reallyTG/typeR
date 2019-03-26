library(creditr)


### Name: add_dates
### Title: Return CDS dates.
### Aliases: add_dates

### ** Examples

x <- data.frame(date = c(as.Date("2014-05-06"), as.Date("2014-05-07")),
                tenor = rep(5, 2), currency = c("JPY", "USD"))
add_dates(x)



