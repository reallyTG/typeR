library(sunburstR)


### Name: add_shiny
### Title: Add Shiny Events
### Aliases: add_shiny

### ** Examples

## Not run: 
##D 
##D library(shiny)
##D library(sunburstR)
##D 
##D sequences <- read.csv(
##D   system.file("examples/visit-sequences.csv",package="sunburstR")
##D   ,header=F
##D   ,stringsAsFactors = FALSE
##D )
##D 
##D 
##D server <- function(input,output,session){
##D 
##D   output$sunburst <- renderSunburst({
##D     #invalidateLater(1000, session)
##D 
##D     sequences <- sequences[sample(nrow(sequences),1000),]
##D 
##D     add_shiny(sunburst(sequences))
##D   })
##D 
##D 
##D   selection <- reactive({
##D     input$sunburst_mouseover
##D   })
##D 
##D   output$selection <- renderText(selection())
##D }
##D 
##D 
##D ui<-fluidPage(
##D   sidebarLayout(
##D     sidebarPanel(
##D 
##D     ),
##D 
##D     # plot sunburst
##D     mainPanel(
##D       sunburstOutput("sunburst"),
##D       textOutput("selection")
##D     )
##D   )
##D )
##D 
##D shinyApp(ui = ui, server = server)
## End(Not run)



