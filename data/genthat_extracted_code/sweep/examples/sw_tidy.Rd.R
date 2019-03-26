library(sweep)


### Name: sw_tidy
### Title: Tidy the result of a time-series model into a summary tibble
### Aliases: sw_tidy

### ** Examples

library(forecast)
WWWusage %>%
    auto.arima() %>%
    sw_tidy(conf.int = TRUE)




