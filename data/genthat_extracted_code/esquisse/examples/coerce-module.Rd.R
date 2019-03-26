library(esquisse)


### Name: coerce-module
### Title: Coerce data.frame's columns module
### Aliases: coerce-module coerceUI coerceServer

### ** Examples


if (interactive()) {
  library(esquisse)
  library(shiny)
  
  foo <- data.frame(
    num_as_char = as.character(1:10),
    char = sample(letters[1:3], 10, TRUE),
    fact = factor(sample(LETTERS[1:3], 10, TRUE)),
    date_as_char =  as.character(
      Sys.Date() + sample(seq(-10, 10), 10, TRUE)
    ),
    date_as_num = as.numeric(
      Sys.Date() + sample(seq(-10, 10), 10, TRUE)
    ),
    datetime = Sys.time() + sample(seq(-10, 10) * 1e4, 10, TRUE), 
    stringsAsFactors = FALSE
  )
  
  ui <- fluidPage(
    tags$h2("Coerce module"),
    fluidRow(
      column(
        width = 4,
        coerceUI(id = "exemple", data = foo)
      ),
      column(
        width = 8,
        verbatimTextOutput(outputId = "print_result"),
        verbatimTextOutput(outputId = "print_names")
      )
    )
  )
  
  server <- function(input, output, session) {
    
    result <- callModule(module = coerceServer, id = "exemple", data = foo)
    
    output$print_result <- renderPrint({
      str(result$data)
    })
    output$print_names <- renderPrint({
      result$names
    })
  }
  
  shinyApp(ui, server)
}




