library(ggstatsplot)


### Name: bartlett_message
### Title: Display homogeneity of variance test as a message
### Aliases: bartlett_message

### ** Examples


# getting message
ggstatsplot::bartlett_message(
  data = iris,
  x = Species,
  y = Sepal.Length,
  lab = "Iris Species"
)

# getting results from the test
ggstatsplot::bartlett_message(
  data = mtcars,
  x = am,
  y = wt,
  output = "tidy"
)



