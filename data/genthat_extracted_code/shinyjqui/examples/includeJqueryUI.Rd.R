library(shinyjqui)


### Name: includeJqueryUI
### Title: Inject necessary js and css assets to the head of a shiny
###   document (deprecated).
### Aliases: includeJqueryUI

### ** Examples

if (interactive()) {
  library(shiny)

  shinyApp(
    ui = fluidPage(
      includeJqueryUI(),
      # other ui codes
    ),
    server = function(input, output) {
      # server codes
    }
  )
}



