library(mosaicData)


### Name: Births
### Title: US Births
### Aliases: Births

### ** Examples

data(Births)
if(require(ggplot2)) {
  ggplot(data = Births, aes(x = date, y = births, colour = ~ wday)) +
    stat_smooth(se = FALSE, alpha = 0.8, geom = "line")
  ggplot(data = Births, aes(x = day_of_year, y = births, colour = ~ wday)) +
    geom_point(size = 0.4, alpha = 0.5) +
    stat_smooth(se = FALSE, geom = "line", alpha = 0.6, size = 1.5)
  if (require(dplyr)) {
    ggplot(
     data =  bind_cols(Births %>% filter(year == 1978), 
                       Births78 %>% rename(births78 = births)),
     aes(x = births - births78)
     ) +
     geom_histogram(binwidth = 1)
  }
}




