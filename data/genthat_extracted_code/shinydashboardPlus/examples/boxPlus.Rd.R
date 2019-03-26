library(shinydashboardPlus)


### Name: boxPlus
### Title: Create a box for the main body of a dashboard
### Aliases: boxPlus

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {
 library(shiny)
 library(shinydashboard)

 shinyApp(
   ui = dashboardPagePlus(
     dashboardHeaderPlus(),
     dashboardSidebar(),
     dashboardBody(
      fluidRow(
       boxPlus(
        title = "Closable Box with dropdown", 
         closable = TRUE, 
         status = "warning", 
         solidHeader = FALSE, 
         collapsible = TRUE,
         enable_dropdown = TRUE,
         dropdown_icon = "wrench",
         dropdown_menu = dropdownItemList(
          dropdownItem(url = "http://www.google.com", name = "Link to google"),
          dropdownItem(url = "#", name = "item 2"),
          dropdownDivider(),
          dropdownItem(url = "#", name = "item 3")
         ),
         p("Box Content")
       ),
       boxPlus(
        title = "Closable box, with label", 
         closable = TRUE, 
         enable_label = TRUE,
         label_text = 1,
         label_status = "danger",
         status = "warning", 
         solidHeader = FALSE, 
         collapsible = TRUE,
         p("Box Content")
       )
     )
    )
   ),
   server = function(input, output) {}
 )
 
 # boxPlus with sidebar
 shinyApp(
  ui = dashboardPagePlus(
    dashboardHeaderPlus(),
    dashboardSidebar(),
    dashboardBody(
      setShadow("box"),
      fluidRow(
        boxPlus(
          title = "Closable Box with dropdown", 
          closable = TRUE, 
          status = "warning", 
          solidHeader = FALSE, 
          collapsible = TRUE,
          enable_sidebar = TRUE,
          sidebar_width = 25,
          sidebar_start_open = TRUE,
          sidebar_content = sliderInput(
           "obs", 
           "Number of observations:",
           min = 0, 
           max = 1000, 
           value = 500
          ),
          plotOutput("distPlot")
        )
      )
    )
  ),
  server = function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs))
    })
  }
 )
}



