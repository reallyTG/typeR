library(ggridges)


### Name: stat_binline
### Title: Stat for histogram ridgeline plots
### Aliases: stat_binline StatBinline
### Keywords: datasets

### ** Examples

library(ggplot2)

ggplot(iris, aes(x = Sepal.Length, y = Species, group = Species, fill = Species)) +
  geom_density_ridges(stat = "binline", bins = 20, scale = 2.2) +
  scale_y_discrete(expand = c(0.01, 0)) +
  scale_x_continuous(expand = c(0.01, 0)) +
  theme_ridges()

ggplot(iris, aes(x = Sepal.Length, y = Species, group = Species, fill = Species)) +
  stat_binline(bins = 20, scale = 2.2, draw_baseline = FALSE) +
  scale_y_discrete(expand = c(0.01, 0)) +
  scale_x_continuous(expand = c(0.01, 0)) +
  scale_fill_grey() +
  theme_ridges() + theme(legend.position = 'none')

require(ggplot2movies)
require(viridis)
ggplot(movies[movies$year>1989,], aes(x = length, y = year, fill = factor(year))) +
   stat_binline(scale = 1.9, bins = 40) +
   theme_ridges() + theme(legend.position = "none") +
   scale_x_continuous(limits = c(1, 180), expand = c(0.01, 0)) +
   scale_y_reverse(expand = c(0.01, 0)) +
   scale_fill_viridis(begin = 0.3, discrete = TRUE, option = "B") +
   labs(title = "Movie lengths 1990 - 2005")

count_data <- data.frame(group = rep(letters[1:5], each = 10),
                         mean = rep(1:5, each = 10))
count_data$group <- factor(count_data$group, levels = letters[5:1])
count_data$count <- rpois(nrow(count_data), count_data$mean)
ggplot(count_data, aes(x = count, y = group, group = group)) +
  geom_density_ridges2(stat = "binline", aes(fill = group), binwidth = 1, scale = 0.95) +
  geom_text(stat = "bin",
          aes(y = group+0.9*..count../max(..count..),
          label = ifelse(..count..>0, ..count.., "")),
          vjust = 1.2, size = 3, color = "white", binwidth = 1) +
  theme_ridges(grid = FALSE) +
  scale_x_continuous(breaks = c(0:12), limits = c(-.5, 13), expand = c(0, 0)) +
  scale_y_discrete(expand = c(0.01, 0)) +
  scale_fill_cyclical(values = c("#0000B0", "#7070D0")) +
  guides(y = "none")



