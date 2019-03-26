library(esquisse)


### Name: esquisserServer
### Title: Esquisse Shiny module
### Aliases: esquisserServer esquisse-module esquisserUI

### ** Examples


if (interactive()) {


### Part of a Shiny app ###

library(shiny)
library(esquisse)

ui <- fluidPage(
  tags$h1("Use esquisse as a Shiny module"),
  radioButtons(
    inputId = "data", 
    label = "Data to use:", 
    choices = c("iris", "mtcars"),
    inline = TRUE
  ),
  tags$div(
    style = "height: 700px;", # needs to be in fixed height container
    esquisserUI(
      id = "esquisse", 
      header = FALSE, # dont display gadget title
      choose_data = FALSE # dont display button to change data
    )
  )
)

server <- function(input, output, session) {
  
  data_r <- reactiveValues(data = iris, name = "iris")
  
  observeEvent(input$data, {
    if (input$data == "iris") {
      data_r$data <- iris
      data_r$name <- "iris"
    } else {
      data_r$data <- mtcars
      data_r$name <- "mtcars"
    }
  })
  
  callModule(module = esquisserServer, id = "esquisse", data = data_r)
  
}

shinyApp(ui, server)



### Whole Shiny app ###

library(shiny)
library(esquisse)


# Load some datasets in app environment
my_data <- data.frame(
  var1 = rnorm(100),
  var2 = sample(letters[1:5], 100, TRUE)
)



ui <- fluidPage(
  tags$div( # needs to be in fixed height container
    style = "position: fixed; top: 0; bottom: 0; right: 0; left: 0;", 
    esquisserUI(id = "esquisse")
  )
)

server <- function(input, output, session) {
  
  callModule(module = esquisserServer, id = "esquisse")
  
}

shinyApp(ui, server)

}




