library(crunchy)


### Name: shinyDataset
### Title: Load a dataset for a Shiny session
### Aliases: shinyDataset

### ** Examples

## Not run: 
##D shinyServer(function(input, output, session) {
##D     ds <- shinyDataset("Your dataset name")
##D 
##D     freqs <- reactive({
##D         fmla <- as.formula(paste("~", input$varname))
##D         crtabs(fmla, data=ds())
##D     })
##D })
## End(Not run)



