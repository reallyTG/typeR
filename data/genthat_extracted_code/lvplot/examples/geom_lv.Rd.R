library(lvplot)


### Name: geom_lv
### Title: Side-by-side LV boxplots with ggplot2.
### Aliases: GeomLv StatLv geom_lv scale_fill_lv stat_lv
### Keywords: datasets

### ** Examples

library(ggplot2)
p <- ggplot(mpg, aes(class, hwy))
p + geom_lv(aes(fill=..LV..)) + scale_fill_brewer()
p + geom_lv() + geom_jitter(width = 0.2)
p + geom_lv(alpha=1, aes(fill=..LV..)) + scale_fill_lv()

# Outliers
p + geom_lv(varwidth = TRUE, aes(fill=..LV..)) + scale_fill_lv()
p + geom_lv(fill = "grey80", colour = "black")
p + geom_lv(outlier.colour = "red", outlier.shape = 1)

# Plots are automatically dodged when any aesthetic is a factor
p + geom_lv(aes(fill = drv))

# varwidth adjusts the width of the boxes according to the number of observations
ggplot(ontime, aes(UniqueCarrier, TaxiIn + TaxiOut)) +
  geom_lv(aes(fill = ..LV..), varwidth=TRUE) +
  scale_fill_lv() +
  scale_y_sqrt() +
  theme_bw()

ontime$DayOfWeek <- as.POSIXlt(ontime$FlightDate)$wday
ggplot(ontime, aes(factor(DayOfWeek), TaxiIn + TaxiOut)) +
  geom_lv(aes(fill = ..LV..)) +
  scale_fill_lv() +
  scale_y_sqrt() +
  theme_bw()



