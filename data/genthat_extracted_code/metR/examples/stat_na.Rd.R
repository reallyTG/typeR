library(metR)


### Name: stat_na
### Title: Filter only NA values.
### Aliases: stat_na StatNa
### Keywords: datasets

### ** Examples

library(ggplot2)
library(data.table)
surface <- reshape2::melt(volcano)
surface <- within(surface, value[Var1 %between% c(20, 30) & Var2 %between% c(20, 30)] <- NA)
surface[sample(1:nrow(surface), 100, replace = FALSE), 3] <- NA

ggplot(surface, aes(Var1, Var2, z = value)) +
    geom_contour_fill(na.fill = TRUE) +
    stat_na(aes(na = value), geom = "tile")




