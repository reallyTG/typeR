library(censusr)


### Name: aggregate_moe
### Title: Aggregated margin of error across multiple geographies
### Aliases: aggregate_moe

### ** Examples

x <- c(3, 5, 12, 4)
aggregate_moe(x)
data_frame(x = x, group = c(1, 1, 2, 2)) %>%
  group_by(group) %>%
  summarise(moe = aggregate_moe(x))




