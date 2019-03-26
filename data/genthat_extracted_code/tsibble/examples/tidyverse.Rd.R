library(tsibble)


### Name: tidyverse
### Title: Tidyverse methods for tsibble
### Aliases: tidyverse arrange.tbl_ts arrange.grouped_ts filter.tbl_ts
###   slice.tbl_ts select.tbl_ts rename.tbl_ts mutate.tbl_ts
###   transmute.tbl_ts summarise.tbl_ts summarize.tbl_ts group_by.tbl_ts
###   ungroup.grouped_ts left_join.tbl_ts right_join.tbl_ts
###   inner_join.tbl_ts full_join.tbl_ts semi_join.tbl_ts anti_join.tbl_ts
###   gather.tbl_ts spread.tbl_ts nest.tbl_ts unnest.lst_ts unnest.tbl_ts
###   fill.grouped_ts

### ** Examples

# Sum over sensors ----
pedestrian %>%
  summarise(Total = sum(Count))
# Back to tibble
pedestrian %>%
  as_tibble() %>%
  summarise(Total = sum(Count))
# example from tidyr
stocks <- tsibble(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocks %>% gather(stock, price, -time)
# example from tidyr
stocks <- tsibble(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)
nested_stock <- stocksm %>% 
  nest(-stock)
stocksm %>% 
  group_by(stock) %>% 
  nest()
nested_stock %>% 
  unnest(key = id(stock))
stock_qtl <- stocksm %>% 
  group_by(stock) %>% 
  index_by(day3 = lubridate::floor_date(time, unit = "3 day")) %>% 
  summarise(
    value = list(quantile(price)), 
    qtl = list(c("0%", "25%", "50%", "75%", "100%"))
  )
unnest(stock_qtl, key = id(qtl))



