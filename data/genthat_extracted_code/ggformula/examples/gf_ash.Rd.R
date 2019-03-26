library(ggformula)


### Name: gf_ash
### Title: Average Shifted Histograms
### Aliases: gf_ash stat_ash geom_ash

### ** Examples

gf_ash(~Sepal.Length, color = ~ Species, data = iris)
gf_ash(~Sepal.Length, color = ~ Species, data = iris, binwidth = 0.3)
gf_ash(~Sepal.Length, color = ~ Species, data = iris, adjust = 2)
ggplot(faithful, aes(x = eruptions)) +
  geom_histogram(aes(y = stat(density)),
    fill = "lightskyblue", colour = "gray50", alpha = 0.2) +
  geom_ash(colour = "red") +
  geom_ash(colour = "forestgreen", adjust = 2) +
  geom_ash(colour = "navy", adjust = 1/2) +
  theme_minimal()



