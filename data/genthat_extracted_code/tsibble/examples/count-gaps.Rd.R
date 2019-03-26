library(tsibble)


### Name: count_gaps
### Title: Count implicit gaps
### Aliases: count_gaps count_gaps.tbl_ts

### ** Examples

ped_gaps <- pedestrian %>% 
  count_gaps(.full = TRUE)
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  stop("Please install the ggplot2 package to run these following examples.")
}
library(ggplot2)
ggplot(ped_gaps, aes(x = Sensor, colour = Sensor)) +
  geom_linerange(aes(ymin = .from, ymax = .to)) +
  geom_point(aes(y = .from)) +
  geom_point(aes(y = .to)) +
  coord_flip() +
  theme(legend.position = "bottom")



