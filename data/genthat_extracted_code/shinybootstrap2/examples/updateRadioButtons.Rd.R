library(shinybootstrap2)


### Name: updateRadioButtons
### Title: Change the value of a radio input on the client
### Aliases: updateRadioButtons

### ** Examples

## Not run: 
##D shinyServer(function(input, output, session) {
##D 
##D   observe({
##D     # We'll use the input$controller variable multiple times, so save it as x
##D     # for convenience.
##D     x <- input$controller
##D 
##D     r_options <- list()
##D     r_options[[sprintf("option label %d 1", x)]] <- sprintf("option-%d-1", x)
##D     r_options[[sprintf("option label %d 2", x)]] <- sprintf("option-%d-2", x)
##D 
##D     # Change values for input$inRadio
##D     updateRadioButtons(session, "inRadio", choices = r_options)
##D 
##D     # Can also set the label and select an item
##D     updateRadioButtons(session, "inRadio2",
##D       label = paste("Radio label", x),
##D       choices = r_options,
##D       selected = sprintf("option-%d-2", x)
##D     )
##D   })
##D })
## End(Not run)



