library(shinyWidgets)


### Name: sendSweetAlert
### Title: Display a Sweet Alert to the user
### Aliases: sendSweetAlert

### ** Examples

## Not run: 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h2("Sweet Alert examples"),
##D   actionButton(
##D     inputId = "success",
##D     label = "Launch a success sweet alert",
##D     icon = icon("check")
##D   ),
##D   actionButton(
##D     inputId = "error",
##D     label = "Launch an error sweet alert",
##D     icon = icon("remove")
##D   ),
##D   actionButton(
##D     inputId = "sw_html",
##D     label = "Sweet alert with HTML",
##D     icon = icon("thumbs-up")
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   observeEvent(input$success, {
##D     sendSweetAlert(
##D       session = session,
##D       title = "Success !!",
##D       text = "All in order",
##D       type = "success"
##D     )
##D   })
##D 
##D   observeEvent(input$error, {
##D     sendSweetAlert(
##D       session = session,
##D       title = "Error !!",
##D       text = "It's broken...",
##D       type = "error"
##D     )
##D   })
##D 
##D   observeEvent(input$sw_html, {
##D     sendSweetAlert(
##D       session = session,
##D       title = NULL,
##D       text = tags$span(
##D         tags$h3("With HTML tags",
##D                 style = "color: steelblue;"),
##D         "In", tags$b("bold"), "and", tags$em("italic"),
##D         tags$br(),
##D         "and",
##D         tags$br(),
##D         "line",
##D         tags$br(),
##D         "breaks",
##D         tags$br(),
##D         "and an icon", icon("thumbs-up")
##D       ),
##D       html = TRUE
##D     )
##D   })
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D 
##D # output in Sweet Alert #
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D shinyApp(
##D   ui = fluidPage(
##D     tags$h1("Click the button"),
##D     actionButton(
##D       inputId = "sw_html",
##D       label = "Sweet alert with plot"
##D     ),
##D     # SweetAlert width
##D     tags$style(".swal-modal {width: 80%;}")
##D   ),
##D   server = function(input, output, session) {
##D     observeEvent(input$sw_html, {
##D       sendSweetAlert(
##D         session = session,
##D         title = "Yay a plot!",
##D         text = tags$div(
##D           plotOutput(outputId = "plot"),
##D           sliderInput(
##D             inputId = "clusters",
##D             label = "Number of clusters",
##D             min = 2, max = 6, value = 3, width = "100%"
##D           )
##D         ),
##D         html = TRUE
##D       )
##D     })
##D     output$plot <- renderPlot({
##D       plot(Sepal.Width ~ Sepal.Length,
##D            data = iris, col = Species,
##D            pch = 20, cex = 2)
##D       points(kmeans(iris[, 1:2], input$clusters)$centers,
##D              pch = 4, cex = 4, lwd = 4)
##D     })
##D   }
##D )
##D 
##D }
## End(Not run)



