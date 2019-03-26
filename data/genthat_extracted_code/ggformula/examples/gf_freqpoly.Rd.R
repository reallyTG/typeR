library(ggformula)


### Name: gf_freqpoly
### Title: Formula interface to geom_freqpoly()
### Aliases: gf_freqpoly

### ** Examples

gf_histogram( ~ Sepal.Length | Species, alpha = 0.2, data = iris, bins = 20) %>%
  gf_freqpoly( ~ Sepal.Length, data = iris, color = ~ Species, bins = 20)
gf_freqpoly( ~ Sepal.Length, color = ~ Species, data = iris, bins = 20)
if (utils::packageVersion("ggplot2") > "2.2.1") {
  gf_dens( ~ Sepal.Length, data = iris, color = "navy") %>%
    gf_freqpoly( stat(density) ~ Sepal.Length, data = iris,
      color = "red", bins = 20)
}



