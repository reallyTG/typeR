library(timevis)


### Name: timevis
### Title: Create a timeline visualization
### Aliases: timevis timevis-package

### ** Examples

# For more examples, see http://daattali.com/shiny/timevis-demo/

#----------------------- Most basic -----------------
timevis()

#----------------------- Minimal data -----------------
timevis(
  data.frame(id = 1:2,
             content = c("one", "two"),
             start = c("2016-01-10", "2016-01-12"))
)

#----------------------- Hide the zoom buttons, allow items to be editable -----------------
timevis(
  data.frame(id = 1:2,
             content = c("one", "two"),
             start = c("2016-01-10", "2016-01-12")),
  showZoom = FALSE,
  options = list(editable = TRUE, height = "200px")
)

#----------------------- You can use %>% pipes to create timevis pipelines -----------------
timevis() %>%
  setItems(data.frame(
    id = 1:2,
    content = c("one", "two"),
    start = c("2016-01-10", "2016-01-12")
  )) %>%
  setOptions(list(editable = TRUE)) %>%
  addItem(list(id = 3, content = "three", start = "2016-01-11")) %>%
  setSelection("3") %>%
  fitWindow(list(animation = FALSE))

#------- Items can be a single point or a range, and can contain HTML -------
timevis(
  data.frame(id = 1:2,
             content = c("one", "two<br><h3>HTML is supported</h3>"),
             start = c("2016-01-10", "2016-01-18"),
             end = c("2016-01-14", NA),
             style = c(NA, "color: red;")
  )
)

#----------------------- Alternative look for each item -----------------
timevis(
  data.frame(id = 1:2,
             content = c("one", "two"),
             start = c("2016-01-10", "2016-01-14"),
             end = c(NA, "2016-01-18"),
             type = c("point", "background"))
)

#----------------------- Using a function in the configuration options -----------------
timevis(
  data.frame(id = 1,
             content = "double click anywhere<br>in the timeline<br>to add an item",
             start = "2016-01-01"),
  options = list(
    editable = TRUE,
    onAdd = htmlwidgets::JS('function(item, callback) {
      item.content = "Hello!<br/>" + item.content;
      callback(item);
    }')
  )
)


#----------------------- Using groups -----------------
timevis(data = data.frame(
  start = c(Sys.Date(), Sys.Date(), Sys.Date() + 1, Sys.Date() + 2),
  content = c("one", "two", "three", "four"),
  group = c(1, 2, 1, 2)),
  groups = data.frame(id = 1:2, content = c("G1", "G2"))
 )


#----------------------- Getting data out of the timeline into Shiny -----------------
if (interactive()) {
library(shiny)

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




