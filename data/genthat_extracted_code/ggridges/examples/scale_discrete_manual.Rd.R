library(ggridges)


### Name: scale_discrete_manual
### Title: Generic discrete manual scale
### Aliases: scale_discrete_manual

### ** Examples

library(ggplot2)

ggplot(iris, aes(x=Sepal.Length, y=Species, fill = Species)) +
  geom_density_ridges(aes(point_color = Species, point_fill = Species,
                          point_shape = Species),
                      alpha = .2, jittered_points = TRUE) +
  scale_fill_manual(values = c("#0072b2", "#D55E00", "#009e73")) +
  scale_discrete_manual("point_color", values = c("#0072b2", "#D55E00", "#009e73")) +
  scale_discrete_manual("point_fill", values = c("#0072b280", "#D55E0080", "#009e7380")) +
  scale_discrete_manual("point_shape", values = c(21, 22, 23)) +
  theme_ridges()



