library(timevis)


### Name: timevis-shiny
### Title: Shiny bindings for timevis
### Aliases: renderTimevis timevis-shiny timevisOutput

### ** Examples

if (interactive()) {
library(shiny)

#----------------------- Most basic example -----------------
shinyApp(
  ui = fluidPage(timevisOutput("timeline")),
  server = function(input, output) {
    output$timeline <- renderTimevis(
      timevis()
    )
  }
)


#----------------------- More advanced example -----------------
data <- data.frame(
  id = 1:3,
  start = c("2015-04-04", "2015-04-05 11:00:00", "2015-04-06 15:00:00"),
  end = c("2015-04-08", NA, NA),
  content = c("<h2>Vacation!!!</h2>", "Acupuncture", "Massage"),
  style = c("color: red;", NA, NA)
)

ui <- fluidPage(
  timevisOutput("appts"),
  div("Selected items:", textOutput("selected", inline = TRUE)),
  div("Visible window:", textOutput("window", inline = TRUE)),
  tableOutput("table")
)

server <- function(input, output) {
  output$appts <- renderTimevis(
    timevis(
      data,
      options = list(editable = TRUE, multiselect = TRUE, align = "center")
    )
  )

  output$selected <- renderText(
    paste(input$appts_selected, collapse = " ")
  )

  output$window <- renderText(
    paste(input$appts_window[1], "to", input$appts_window[2])
  )

  output$table <- renderTable(
    input$appts_data
  )
}
shinyApp(ui, server)
}




