library(shinyWidgets)


### Name: setBackgroundColor
### Title: Custom background color for your shinyapp
### Aliases: setBackgroundColor

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D ### Uniform color background :
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h2("Change shiny app background"),
##D   setBackgroundColor("ghostwhite")
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D 
##D ### linear gradient background :
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D 
##D   # use a gradient in background
##D   setBackgroundColor(
##D     color = c("#F7FBFF", "#2171B5"),
##D     gradient = "linear",
##D     direction = "bottom"
##D   ),
##D 
##D   titlePanel("Hello Shiny!"),
##D   sidebarLayout(
##D     sidebarPanel(
##D       sliderInput("obs",
##D                   "Number of observations:",
##D                   min = 0,
##D                   max = 1000,
##D                   value = 500)
##D     ),
##D     mainPanel(
##D       plotOutput("distPlot")
##D     )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D   output$distPlot <- renderPlot({
##D     hist(rnorm(input$obs))
##D   })
##D }
##D 
##D shinyApp(ui, server)
##D 
##D 
##D ### radial gradient background :
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D 
##D   # use a gradient in background
##D   setBackgroundColor(
##D     color = c("#F7FBFF", "#2171B5"),
##D     gradient = "radial",
##D     direction = c("top", "left")
##D   ),
##D 
##D   titlePanel("Hello Shiny!"),
##D   sidebarLayout(
##D     sidebarPanel(
##D       sliderInput("obs",
##D                   "Number of observations:",
##D                   min = 0,
##D                   max = 1000,
##D                   value = 500)
##D     ),
##D     mainPanel(
##D       plotOutput("distPlot")
##D     )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D   output$distPlot <- renderPlot({
##D     hist(rnorm(input$obs))
##D   })
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



