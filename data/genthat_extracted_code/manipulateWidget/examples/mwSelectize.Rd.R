library(manipulateWidget)


### Name: mwSelectize
### Title: Add a Select list input to a manipulateWidget gadget
### Aliases: mwSelectize

### ** Examples

if (require(plotly)) {
  mydata <- data.frame(x = 1:100, y = rnorm(100))

  # Select multiple values
  manipulateWidget(
    {
      if (length(species) == 0) mydata <- iris
      else mydata <- iris[iris$Species %in% species,]

      plot_ly(mydata, x = ~Sepal.Length, y = ~Sepal.Width,
              color = ~droplevels(Species), type = "scatter", mode = "markers")
    },
    species = mwSelectize(c("Select one or two species : " = "", levels(iris$Species)),
        multiple = TRUE, options = list(maxItems = 2))
  )
}




