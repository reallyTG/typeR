library(shinydashboardPlus)


### Name: accordion
### Title: AdminLTE2 accordion container
### Aliases: accordion

### ** Examples

if (interactive()) {
 library(shiny)
 library(shinydashboard)
 shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(
     box(
      title = "Accordion Demo",
      accordion(
        accordionItem(
          id = 1,
          title = "Accordion Item 1",
          color = "danger",
          collapsed = TRUE,
          "This is some text!"
        ),
        accordionItem(
          id = 2,
          title = "Accordion Item 2",
          color = "warning",
          collapsed = FALSE,
          "This is some text!"
        ),
        accordionItem(
          id = 3,
          title = "Accordion Item 3",
          color = "info",
          collapsed = FALSE,
          "This is some text!"
        )
      )
     )
    ),
    title = "Accordion"
  ),
  server = function(input, output) { }
 )
}




