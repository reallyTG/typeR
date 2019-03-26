library(shinyWidgets)


### Name: useBs4Dash
### Title: Use 'bs4Dash' in 'shiny'
### Aliases: useBs4Dash

### ** Examples

## Not run: 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(bs4Dash)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   h1("Import bs4Dash elements inside shiny!", align = "center"),
##D   h5("Don't need any sidebar, navbar, ...", align = "center"),
##D   h5("Only focus on basic elements for a pure interface", align = "center"),
##D 
##D   # use this in non dashboard app
##D   setBackgroundColor(color = "ghostwhite"),
##D   useBs4Dash(old_school = FALSE),
##D 
##D   # infoBoxes
##D   fluidRow(
##D     bs4InfoBox(
##D       title = "Messages",
##D       value = 1410,
##D       icon = "envelope"
##D       ),
##D       bs4InfoBox(
##D         title = "Bookmarks",
##D         status = "info",
##D         value = 240,
##D         icon = "bookmark"
##D       ),
##D       bs4InfoBox(
##D         title = "Comments",
##D         gradientColor = "danger",
##D         value = 41410,
##D         icon = "comments"
##D       )
##D   ),
##D 
##D   # valueBoxes
##D   fluidRow(
##D     bs4ValueBox(
##D       value = uiOutput("orderNum"),
##D       subtitle = "New Orders",
##D       icon = "credit-card",
##D       href = "http://google.com"
##D     ),
##D     bs4ValueBox(
##D       value = "60%",
##D       subtitle = "Approval Rating",
##D       icon = "line-chart",
##D       status = "success"
##D     ),
##D     bs4ValueBox(
##D       value = htmlOutput("progress"),
##D       subtitle = "Progress",
##D       icon = "users",
##D       status = "danger"
##D     )
##D   ),
##D 
##D   # Boxes
##D   fluidRow(
##D     bs4Card(
##D      status = "primary",
##D      sliderInput("orders", "Orders", min = 1, max = 2000, value = 650),
##D      selectInput(
##D       "progress",
##D       "Progress",
##D        choices = c(
##D          "0%" = 0, "20%" = 20, "40%" = 40,
##D           "60%" = 60, "80%" = 80, "100%" = 100
##D        )
##D       )
##D     ),
##D    bs4Card(
##D     title = "Histogram box title",
##D     status = "warning",
##D     solidHeader = TRUE,
##D     collapsible = TRUE,
##D     plotOutput("plot", height = 250)
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
##D     paste0(input$progress)
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
## End(Not run)



