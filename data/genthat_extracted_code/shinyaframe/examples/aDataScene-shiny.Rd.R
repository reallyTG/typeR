library(shinyaframe)


### Name: aDataScene-shiny
### Title: Shiny bindings for aDataScene
### Aliases: aDataScene-shiny aDataSceneOutput renderADataScene

### ** Examples

# Simple 3D scatterplot.
# See package vignette for additional asethetics, guides, and legends
if (interactive()) {
  library(dplyr)
  library(shiny)
  library(scales)
  shinyApp(
    ui = fluidPage(
      aDataSceneOutput(
        outputId = "mydatascene",
        # gg-aframe plot syntax
        atags$entity(
          plot = "", position = "0 1.6 -1.38", rotation = "0 45 0",
          atags$entity(
            `layer-point` = "", `mod-oscillate` = "",
            `data-binding__sepal.length`="target: layer-point.x",
            `data-binding__sepal.width`="target: layer-point.y",
            `data-binding__petal.length`="target: layer-point.z",
            # add 4th positional by animating y position between two mappings
            `data-binding__petal.width`="target: mod-oscillate.y",
            `data-binding__species`="target: layer-point.shape"
          )
        )
      )
    ),
    server = function(input, output, session) {
      output$mydatascene <- renderADataScene({
        names(iris) <- tolower(names(iris))
        iris %>%
          # scale positional data
          mutate_if(is.numeric, rescale) %>%
          aDataScene()
      })
    }
  )
}




