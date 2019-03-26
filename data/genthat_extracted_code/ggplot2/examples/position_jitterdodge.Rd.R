library(ggplot2)


### Name: position_jitterdodge
### Title: Simultaneously dodge and jitter
### Aliases: position_jitterdodge

### ** Examples

dsub <- diamonds[ sample(nrow(diamonds), 1000), ]
ggplot(dsub, aes(x = cut, y = carat, fill = clarity)) +
  geom_boxplot(outlier.size = 0) +
  geom_point(pch = 21, position = position_jitterdodge())



