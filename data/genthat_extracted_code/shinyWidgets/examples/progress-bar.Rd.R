library(shinyWidgets)


### Name: progress-bar
### Title: Progress Bars
### Aliases: progress-bar progressBar updateProgressBar

### ** Examples

## Not run: 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   column(
##D     width = 7,
##D     tags$b("Default"), br(),
##D     progressBar(id = "pb1", value = 50),
##D     sliderInput(
##D       inputId = "up1",
##D       label = "Update",
##D       min = 0,
##D       max = 100,
##D       value = 50
##D     ),
##D     br(),
##D     tags$b("Other options"), br(),
##D     progressBar(
##D       id = "pb2",
##D       value = 0,
##D       total = 100,
##D       title = "",
##D       display_pct = TRUE
##D     ),
##D     actionButton(
##D       inputId = "go",
##D       label = "Launch calculation"
##D     )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D   observeEvent(input$up1, {
##D     updateProgressBar(
##D       session = session,
##D       id = "pb1",
##D       value = input$up1
##D     )
##D   })
##D   observeEvent(input$go, {
##D     for (i in 1:100) {
##D       updateProgressBar(
##D         session = session,
##D         id = "pb2",
##D         value = i, total = 100,
##D         title = paste("Process", trunc(i/10))
##D       )
##D       Sys.sleep(0.1)
##D     }
##D   })
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
## End(Not run)



