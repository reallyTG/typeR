library(rintrojs)


### Name: introjs
### Title: Initiate intro.js
### Aliases: introjs hintjs

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
##D       data.intro = "This is the button",
##D       data.hint = "Here is clue"
##D     )
##D   )))
##D server <- shinyServer(function(input, output, session) {
##D 
##D  hintjs(session, options = list("hintButtonLabel"="That was a hint"))
##D 
##D   output$mtcars <- renderTable({
##D     head(mtcars)
##D   })
##D   observeEvent(input$btn,
##D                introjs(session, options = list("nextLabel"="Onwards and Upwards"),
##D                                 events = list("oncomplete"='alert("It is over")')))
##D })
##D # Run the application
##D shinyApp(ui = ui, server = server)
## End(Not run)



