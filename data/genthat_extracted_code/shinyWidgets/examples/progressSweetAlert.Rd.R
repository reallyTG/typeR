library(shinyWidgets)


### Name: progressSweetAlert
### Title: Progress bar in a sweet alert
### Aliases: progressSweetAlert

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D 
##D ui <- fluidPage(
##D   tags$h1("Progress bar in Sweet Alert"),
##D   useSweetAlert(), # /!\ needed with 'progressSweetAlert'
##D   actionButton(
##D     inputId = "go",
##D     label = "Launch long calculation !"
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   observeEvent(input$go, {
##D     progressSweetAlert(
##D       session = session, id = "myprogress",
##D       title = "Work in progress",
##D       display_pct = TRUE, value = 0
##D     )
##D     for (i in seq_len(50)) {
##D       Sys.sleep(0.1)
##D       updateProgressBar(
##D         session = session,
##D         id = "myprogress",
##D          value = i*2
##D       )
##D     }
##D     closeSweetAlert(session = session)
##D     sendSweetAlert(
##D       session = session,
##D       title =" Calculation completed !",
##D       type = "success"
##D     )
##D   })
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
##D 
## End(Not run)



