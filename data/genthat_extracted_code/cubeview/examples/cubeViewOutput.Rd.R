library(cubeview)


### Name: cubeViewOutput
### Title: Widget output/render function for use in Shiny
### Aliases: cubeViewOutput renderCubeView

### ** Examples

if (interactive()) {
  library(shiny)
  library(raster)

  kili_data <- system.file("extdata", "kiliNDVI.tif", package = "cubeview")
  kiliNDVI <- stack(kili_data)

  cube = cubeView(kiliNDVI)

  ui = fluidPage(
    cubeViewOutput("cube", width = 300, height = 300)
  )

  server = function(input, output, session) {
    output$cube <- renderCubeView(cube)
  }

  shinyApp(ui, server)

}




