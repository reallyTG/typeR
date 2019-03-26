library(rclipboard)


### Name: rclipButton
### Title: Send to clipboard action button
### Aliases: rclipButton

### ** Examples

## Not run
## Not run: 
##D library(rclipboard)
##D library(shiny)
##D 
##D # The UI
##D ui <- bootstrapPage(
##D   
##D   rclipboardSetup(),
##D   
##D   # Add a text input
##D   textInput("copytext", "Copy this:", "Zlika!"),
##D 
##D   # UI ouputs for the copy-to-clipboard buttons
##D   uiOutput("clip"),
##D   
##D   # A text input for testing the clipboard content.
##D   textInput("paste", "Paste here:")
##D   
##D )
##D 
##D # The server
##D server <- function(input, output) {
##D 
##D   # Add clipboard buttons
##D   output$clip <- renderUI({
##D     rclipButton("clipbtn", "rclipButton Copy", input$copytext, icon("clipboard"))
##D   })
##D   
##D }
##D 
##D shinyApp(ui = ui, server = server)
## End(Not run)



