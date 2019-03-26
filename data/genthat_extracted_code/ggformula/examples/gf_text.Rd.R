library(ggformula)


### Name: gf_text
### Title: Formula interface to geom_text() and geom_label()
### Aliases: gf_text gf_label

### ** Examples

gf_text(Sepal.Length ~ Sepal.Width, data = iris,
  label = ~ Species, color = ~ Species, size = 2, angle = 30)
gf_point(Sepal.Length ~ Sepal.Width, data = iris, color = ~ Species) %>%
gf_text(Sepal.Length ~ Sepal.Width, data = iris,
  label = ~ Species, color = ~ Species,
  size = 2, angle = 0, hjust = 0, nudge_x  = 0.1, nudge_y = 0.1)

if (require(dplyr)) {
  iris_means <-
    iris %>%
    group_by(Species) %>%
    summarise(Sepal.Length = mean(Sepal.Length), Sepal.Width = mean(Sepal.Width))
  gf_point(Sepal.Length ~ Sepal.Width, data = iris, color = ~ Species) %>%
  gf_label(Sepal.Length ~ Sepal.Width, data = iris_means,
    label = ~ Species, color = ~ Species, size = 2, alpha = 0.7)
}



