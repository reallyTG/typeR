library(shinydashboardPlus)


### Name: boxPad
### Title: AdminLTE2 vertical block container
### Aliases: boxPad

### ** Examples

if (interactive()) {
 library(shiny)
 library(shinydashboard)
 shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(
     box(title = "Box with right pad",
      status = "warning",
      fluidRow(
        column(width = 6),
        column(
          width = 6,
          boxPad(
            color = "green",
            descriptionBlock(
              header = "8390", 
              text = "VISITS", 
              right_border = FALSE,
              margin_bottom = TRUE
            ),
            descriptionBlock(
              header = "30%", 
              text = "REFERRALS", 
              right_border = FALSE,
              margin_bottom = TRUE
            ),
            descriptionBlock(
              header = "70%", 
              text = "ORGANIC", 
              right_border = FALSE,
              margin_bottom = FALSE
            )
          )
        )
      )
     )
    ),
    title = "boxPad"
  ),
  server = function(input, output) { }
 )
}




