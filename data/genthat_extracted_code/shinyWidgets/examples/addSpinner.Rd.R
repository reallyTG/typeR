library(shinyWidgets)


### Name: addSpinner
### Title: Display a spinner above an output when this one recalculate
### Aliases: addSpinner

### ** Examples

## Not run: 
##D # wrap an output:
##D addSpinner(plotOutput("plot"))
##D 
##D # Complete demo:
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h2("Exemple spinners"),
##D   actionButton(inputId = "refresh", label = "Refresh", width = "100%"),
##D   fluidRow(
##D     column(
##D       width = 5, offset = 1,
##D       addSpinner(plotOutput("plot1"), spin = "circle", color = "#E41A1C"),
##D       addSpinner(plotOutput("plot3"), spin = "bounce", color = "#377EB8"),
##D       addSpinner(plotOutput("plot5"), spin = "folding-cube", color = "#4DAF4A"),
##D       addSpinner(plotOutput("plot7"), spin = "rotating-plane", color = "#984EA3"),
##D       addSpinner(plotOutput("plot9"), spin = "cube-grid", color = "#FF7F00")
##D     ),
##D     column(
##D       width = 5,
##D       addSpinner(plotOutput("plot2"), spin = "fading-circle", color = "#FFFF33"),
##D       addSpinner(plotOutput("plot4"), spin = "double-bounce", color = "#A65628"),
##D       addSpinner(plotOutput("plot6"), spin = "dots", color = "#F781BF"),
##D       addSpinner(plotOutput("plot8"), spin = "cube", color = "#999999")
##D     )
##D   ),
##D   actionButton(inputId = "refresh2", label = "Refresh", width = "100%")
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   dat <- reactive({
##D     input$refresh
##D     input$refresh2
##D     Sys.sleep(3)
##D     Sys.time()
##D   })
##D 
##D   lapply(
##D     X = seq_len(9),
##D     FUN = function(i) {
##D       output[[paste0("plot", i)]] <- renderPlot({
##D         dat()
##D         plot(sin, -pi, i*pi)
##D       })
##D     }
##D   )
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



