library(googleVis)


### Name: renderGvis
### Title: renderGvis
### Aliases: renderGvis
### Keywords: shiny

### ** Examples

  
## Not run: 
##D # To run this example:
##D shiny::runApp(system.file("shiny/", package="googleVis"))
##D # server.R
##D library(googleVis)
##D 
##D shinyServer(function(input, output) {
##D   datasetInput <- reactive({
##D     switch(input$dataset,
##D            "rock" = rock,
##D            "pressure" = pressure,
##D            "cars" = cars)
##D   })
##D   
##D   output$view <- renderGvis({
##D     gvisScatterChart(datasetInput(),
##D                      options=list(title=paste('Data:',input$dataset)))
##D   })
##D })
##D 
##D # ui.R
##D shinyUI(pageWithSidebar(
##D   headerPanel("googleVis on Shiny"),
##D   sidebarPanel(
##D     selectInput("dataset", "Choose a dataset:",
##D                 choices = c("rock", "pressure", "cars"))
##D   ),
##D   mainPanel(
##D     htmlOutput("view")
##D   )
##D ))
## End(Not run)





