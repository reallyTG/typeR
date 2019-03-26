library(manipulateWidget)


### Name: mwCheckboxGroup
### Title: Add a group of checkboxes to a manipulateWidget gadget
### Aliases: mwCheckboxGroup

### ** Examples

if (require(plotly)) {
  manipulateWidget(
    {
      if (length(species) == 0) mydata <- iris
      else mydata <- iris[iris$Species %in% species,]

      plot_ly(mydata, x = ~Sepal.Length, y = ~Sepal.Width,
              color = ~droplevels(Species), type = "scatter", mode = "markers")
    },
    species = mwCheckboxGroup(levels(iris$Species))
  )
}




