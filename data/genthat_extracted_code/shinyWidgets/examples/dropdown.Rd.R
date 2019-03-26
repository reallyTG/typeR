library(shinyWidgets)


### Name: dropdown
### Title: Dropdown
### Aliases: dropdown

### ** Examples

## Not run: 
##D ## Only run examples in interactive R sessions
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   tags$h2("pickerInput in dropdown"),
##D   br(),
##D   dropdown(
##D 
##D     tags$h3("List of Input"),
##D 
##D     pickerInput(inputId = 'xcol2',
##D                 label = 'X Variable',
##D                 choices = names(iris),
##D                 options = list(`style` = "btn-info")),
##D 
##D     pickerInput(inputId = 'ycol2',
##D                 label = 'Y Variable',
##D                 choices = names(iris),
##D                 selected = names(iris)[[2]],
##D                 options = list(`style` = "btn-warning")),
##D 
##D     sliderInput(inputId = 'clusters2',
##D                 label = 'Cluster count',
##D                 value = 3,
##D                 min = 1, max = 9),
##D 
##D     style = "unite", icon = icon("gear"),
##D     status = "danger", width = "300px",
##D     animate = animateOptions(
##D       enter = animations$fading_entrances$fadeInLeftBig,
##D       exit = animations$fading_exits$fadeOutRightBig
##D     )
##D   ),
##D 
##D   plotOutput(outputId = 'plot2')
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   selectedData2 <- reactive({
##D     iris[, c(input$xcol2, input$ycol2)]
##D   })
##D 
##D   clusters2 <- reactive({
##D     kmeans(selectedData2(), input$clusters2)
##D   })
##D 
##D   output$plot2 <- renderPlot({
##D     palette(c("#E41A1C", "#377EB8", "#4DAF4A",
##D               "#984EA3", "#FF7F00", "#FFFF33",
##D               "#A65628", "#F781BF", "#999999"))
##D 
##D     par(mar = c(5.1, 4.1, 0, 1))
##D     plot(selectedData2(),
##D          col = clusters2()$cluster,
##D          pch = 20, cex = 3)
##D     points(clusters2()$centers, pch = 4, cex = 4, lwd = 4)
##D   })
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
## End(Not run)



