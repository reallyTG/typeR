library(shinythemes)


### Name: shinythemes
### Title: Themes for Shiny
### Aliases: shinythemes shinythemes-package

### ** Examples

## Not run: 
##D library(shiny)
##D library(shinythemes)
##D 
##D # A very basic navbar page with different themes
##D shinyApp(
##D   ui = navbarPage("Default theme",
##D     tabPanel("Plot", "Plot tab contents..."),
##D     navbarMenu("More",
##D       tabPanel("Summary", "Summary tab contents..."),
##D       tabPanel("Table", "Table tab contents...")
##D     )
##D   ),
##D   server = function(input, output) { }
##D )
##D 
##D shinyApp(
##D   ui = navbarPage("United",
##D     theme = shinytheme("united"),
##D     tabPanel("Plot", "Plot tab contents..."),
##D     navbarMenu("More",
##D       tabPanel("Summary", "Summary tab contents..."),
##D       tabPanel("Table", "Table tab contents...")
##D     )
##D   ),
##D   server = function(input, output) { }
##D )
##D 
##D shinyApp(
##D   ui = navbarPage("Cerulean",
##D     theme = shinytheme("cerulean"),
##D     tabPanel("Plot", "Plot tab contents..."),
##D     navbarMenu("More",
##D       tabPanel("Summary", "Summary tab contents..."),
##D       tabPanel("Table", "Table tab contents...")
##D     )
##D   ),
##D   server = function(input, output) { }
##D )
##D 
##D 
##D # A more complicated app with the flatly theme
##D shinyApp(
##D   ui = fluidPage(
##D     theme = shinytheme("flatly"),
##D     titlePanel("Tabsets"),
##D     sidebarLayout(
##D       sidebarPanel(
##D         radioButtons("dist", "Distribution type:",
##D                      c("Normal" = "norm",
##D                        "Uniform" = "unif",
##D                        "Log-normal" = "lnorm",
##D                        "Exponential" = "exp")),
##D         br(),
##D         sliderInput("n", "Number of observations:",
##D                      value = 500, min = 1, max = 1000)
##D       ),
##D       mainPanel(
##D         tabsetPanel(type = "tabs",
##D           tabPanel("Plot", plotOutput("plot")),
##D           tabPanel("Summary", verbatimTextOutput("summary")),
##D           tabPanel("Table", tableOutput("table"))
##D         )
##D       )
##D     )
##D   ),
##D   server = function(input, output) {
##D     data <- reactive({
##D       dist <- switch(input$dist,
##D                      norm = rnorm,
##D                      unif = runif,
##D                      lnorm = rlnorm,
##D                      exp = rexp,
##D                      rnorm)
##D       dist(input$n)
##D     })
##D 
##D     output$plot <- renderPlot({
##D       dist <- input$dist
##D       n <- input$n
##D       hist(data(), main=paste('r', dist, '(', n, ')', sep=''))
##D     })
##D 
##D     output$summary <- renderPrint({
##D       summary(data())
##D     })
##D 
##D     output$table <- renderTable({
##D       data.frame(x=data())
##D     })
##D   }
##D )
## End(Not run)



