library(htmlwidgets)


### Name: htmlwidgets-shiny
### Title: Shiny bindings for HTML widgets
### Aliases: htmlwidgets-shiny shinyWidgetOutput shinyRenderWidget

### ** Examples

# shiny output binding for a widget named 'foo'
fooOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "foo", width, height)
}

# shiny render function for a widget named 'foo'
renderFoo <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, fooOutput, env, quoted = TRUE)
}



