library(lvplot)


### Name: ontime
### Title: Ontime Flight Data
### Aliases: ontime
### Keywords: datasets

### ** Examples

library(ggplot2)
ggplot(ontime, aes(UniqueCarrier, TaxiIn + TaxiOut)) +
  geom_lv(aes(fill = ..LV..)) +
  scale_fill_lv() +
  scale_y_sqrt() +
  theme_bw()



