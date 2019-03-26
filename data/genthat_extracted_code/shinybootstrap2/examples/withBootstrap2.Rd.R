library(shinybootstrap2)


### Name: withBootstrap2
### Title: Run Shiny UI code with Bootstrap 2 elements.
### Aliases: withBootstrap2

### ** Examples

## Not run: 
##D library(shiny)
##D 
##D ## Single-file app using Bootstrap 2 ===========================
##D shinybootstrap2::withBootstrap2({
##D   shinyApp(
##D     ui = fluidPage(
##D       numericInput("n", "n", 1),
##D       plotOutput("plot")
##D     ),
##D     server = function(input, output) {
##D       output$plot <- renderPlot( plot(head(cars, input$n)) )
##D     }
##D   )
##D })
##D 
##D 
##D ## App with server.R and UI. R =================================
##D ## ui.R
##D shinybootstrap2::withBootstrap2({
##D   fluidPage(
##D     selectInput("ui", "Input type", choices = c("numeric", "slider")),
##D     uiOutput("n_ui"),
##D     plotOutput("plot")
##D   )
##D })
##D 
##D ## server.R
##D # In server.R, it's only necessary to wrap code in withBoostrap2()
##D # when renderUI() is used.
##D shinybootstrap2::withBootstrap2({
##D   function(input, output) {
##D     output$n_ui <- renderUI({
##D       if (input$ui == "numeric")
##D         numericInput("n", "n", 1)
##D       else if (input$ui == "slider")
##D         sliderInput("n", "n", 1, 10, value = 1)
##D     })
##D     output$plot <- renderPlot( plot(head(cars, input$n)) )
##D   }
##D })
##D 
## End(Not run)



