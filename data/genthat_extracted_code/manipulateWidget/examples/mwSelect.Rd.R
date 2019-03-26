library(manipulateWidget)


### Name: mwSelect
### Title: Add a Select list input to a manipulateWidget gadget
### Aliases: mwSelect

### ** Examples

if (require(plotly)) {
  mydata <- data.frame(x = 1:100, y = rnorm(100))

  manipulateWidget(
    {
      mode <- switch(type, points = "markers", lines = "lines", both = "markers+lines")
      plot_ly(mydata, x=~x, y=~y, type = "scatter", mode = mode)
    },
    type = mwSelect(c("points", "lines", "both"))
  )

  Sys.sleep(0.5)

  # Select multiple values
  manipulateWidget(
    {
      if (length(species) == 0) mydata <- iris
      else mydata <- iris[iris$Species %in% species,]

      plot_ly(mydata, x = ~Sepal.Length, y = ~Sepal.Width,
              color = ~droplevels(Species), type = "scatter", mode = "markers")
    },
    species = mwSelect(levels(iris$Species), multiple = TRUE)
  )
}




