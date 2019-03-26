library(shinyWidgets)


### Name: useShinydashboard
### Title: Use 'shinydashboard' in 'shiny'
### Aliases: useShinydashboard

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinydashboard)
##D library(shinyWidgets)
##D 
##D # example taken from ?box
##D 
##D ui <- fluidPage(
##D   tags$h2("Classic shiny"),
##D 
##D   # use this in non shinydashboard app
##D   setBackgroundColor(color = "ghostwhite"),
##D   useShinydashboard(),
##D   # -----------------
##D 
##D   # infoBoxes
##D   fluidRow(
##D     infoBox(
##D       "Orders", uiOutput("orderNum2"), "Subtitle", icon = icon("credit-card")
##D     ),
##D     infoBox(
##D       "Approval Rating", "60%", icon = icon("line-chart"), color = "green",
##D       fill = TRUE
##D     ),
##D     infoBox(
##D       "Progress", uiOutput("progress2"), icon = icon("users"), color = "purple"
##D     )
##D   ),
##D 
##D   # valueBoxes
##D   fluidRow(
##D     valueBox(
##D       uiOutput("orderNum"), "New Orders", icon = icon("credit-card"),
##D       href = "http://google.com"
##D     ),
##D     valueBox(
##D       tagList("60", tags$sup(style="font-size: 20px", "%")),
##D       "Approval Rating", icon = icon("line-chart"), color = "green"
##D     ),
##D     valueBox(
##D       htmlOutput("progress"), "Progress", icon = icon("users"), color = "purple"
##D     )
##D   ),
##D 
##D   # Boxes
##D   fluidRow(
##D     box(status = "primary",
##D         sliderInput("orders", "Orders", min = 1, max = 2000, value = 650),
##D         selectInput("progress", "Progress",
##D                     choices = c("0%" = 0, "20%" = 20, "40%" = 40, "60%" = 60, "80%" = 80,
##D                                 "100%" = 100)
##D         )
##D     ),
##D     box(title = "Histogram box title",
##D         status = "warning", solidHeader = TRUE, collapsible = TRUE,
##D         plotOutput("plot", height = 250)
##D     )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$orderNum <- renderText({
##D     prettyNum(input$orders, big.mark=",")
##D   })
##D 
##D   output$orderNum2 <- renderText({
##D     prettyNum(input$orders, big.mark=",")
##D   })
##D 
##D   output$progress <- renderUI({
##D     tagList(input$progress, tags$sup(style="font-size: 20px", "%"))
##D   })
##D 
##D   output$progress2 <- renderUI({
##D     paste0(input$progress, "%")
##D   })
##D 
##D 
##D   output$plot <- renderPlot({
##D     hist(rnorm(input$orders))
##D   })
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



