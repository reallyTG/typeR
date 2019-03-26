library(ggvis)


### Name: shiny-ggvis
### Title: Connect a ggvis graphic to a shiny app.
### Aliases: shiny-ggvis bind_shiny bind_shiny_ui ggvisOutput

### ** Examples

## Run these examples only in interactive R sessions
if (interactive()) {

# Simplest possible app:
library(shiny)
runApp(list(
  ui = bootstrapPage(
    ggvisOutput("p"),
    uiOutput("p_ui")
  ),
  server = function(..., session) {
    mtcars %>%
      ggvis(~wt, ~mpg) %>%
      layer_points() %>%
      layer_smooths(span = input_slider(0, 1)) %>%
      bind_shiny("p", "p_ui")
  }
))

}



