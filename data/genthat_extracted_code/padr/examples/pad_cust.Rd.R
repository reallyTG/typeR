library(padr)


### Name: pad_cust
### Title: Pad with a custom spanning
### Aliases: pad_cust

### ** Examples

library(dplyr)
# analysis of traffic accidents in traffic jam hours and other hours.
accidents <- emergency %>% filter(title == "Traffic: VEHICLE ACCIDENT -")
spanning <- span_time("20151210 16", "20161017 17", tz = "EST") %>%
  subset_span(list(hour = c(6, 9, 16, 19)))
thicken_cust(accidents, spanning, "period") %>%
  count(period) %>%
  pad_cust(spanning)



