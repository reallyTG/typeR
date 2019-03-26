library(shinybootstrap2)


### Name: updateCheckboxGroupInput
### Title: Change the value of a checkbox group input on the client
### Aliases: updateCheckboxGroupInput

### ** Examples

## Not run: 
##D shinyServer(function(input, output, session) {
##D 
##D   observe({
##D     # We'll use the input$controller variable multiple times, so save it as x
##D     # for convenience.
##D     x <- input$controller
##D 
##D     # Create a list of new options, where the name of the items is something
##D     # like 'option label x 1', and the values are 'option-x-1'.
##D     cb_options <- list()
##D     cb_options[[sprintf("option label %d 1", x)]] <- sprintf("option-%d-1", x)
##D     cb_options[[sprintf("option label %d 2", x)]] <- sprintf("option-%d-2", x)
##D 
##D     # Change values for input$inCheckboxGroup
##D     updateCheckboxGroupInput(session, "inCheckboxGroup", choices = cb_options)
##D 
##D     # Can also set the label and select items
##D     updateCheckboxGroupInput(session, "inCheckboxGroup2",
##D       label = paste("checkboxgroup label", x),
##D       choices = cb_options,
##D       selected = sprintf("option-%d-2", x)
##D     )
##D   })
##D })
## End(Not run)



