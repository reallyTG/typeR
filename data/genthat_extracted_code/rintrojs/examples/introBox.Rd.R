library(rintrojs)


### Name: introBox
### Title: Generate intro elements in UI
### Aliases: introBox

### ** Examples

## Not run: 
##D library(rintrojs)
##D library(shiny)
##D ui <- shinyUI(fluidPage(
##D   introjsUI(), # must include in UI
##D   mainPanel(
##D     introBox(
##D       tableOutput("mtcars"),
##D       data.step = 1,
##D       data.intro = "This is the table"
##D     ),
##D     introBox(
##D       actionButton("btn","Intro"),
##D       data.step = 2,
##D       data.intro = "This is the button"
##D     )
##D   )))
##D server <- shinyServer(function(input, output, session) {
##D   output$mtcars <- renderTable({
##D     head(mtcars)
##D   })
##D   observeEvent(input$btn,
##D                introjs(session))
##D })
##D # Run the application
##D shinyApp(ui = ui, server = server)
## End(Not run)



