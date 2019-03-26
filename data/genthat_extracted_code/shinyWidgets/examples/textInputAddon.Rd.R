library(shinyWidgets)


### Name: textInputAddon
### Title: Text with Add-on Input Control
### Aliases: textInputAddon

### ** Examples

## Not run: 
##D ## Only run examples in interactive R sessions
##D if (interactive()) {
##D shinyApp(
##D   ui = fluidPage(
##D     textInputAddon(inputId = "id", label = "Label", placeholder = "Username", addon = icon("at")),
##D     verbatimTextOutput(outputId = "out")
##D   ),
##D   server = function(input, output) {
##D     output$out <- renderPrint({
##D       input$id
##D     })
##D   }
##D )
##D }
## End(Not run)




