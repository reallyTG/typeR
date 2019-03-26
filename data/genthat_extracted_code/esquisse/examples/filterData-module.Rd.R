library(esquisse)


### Name: filterData-module
### Title: Modules for creating filters from a data.frame
### Aliases: filterData-module filterDataUI filterDataServer

### ** Examples


if (interactive()) {
library(shiny)
library(shinyWidgets)
library(esquisse)

ui <- fluidPage(
  
  tags$h1("Module Filter Data"),
  
  fluidRow(
    column(
      width = 4,
      radioButtons(
        inputId = "dataset", label = "Data:",
        choices = c("iris", "mtcars", "Titanic")
      ),
      filterDataUI("ex")
    ),
    column(
      width = 8,
      progressBar(
        id = "pbar", value = 100, 
        total = 100, display_pct = TRUE
      ),
      DT::dataTableOutput(outputId = "tab"),
      verbatimTextOutput(outputId = "code")
    )
  )
  
)

server <- function(input, output, session) {
  
  data <- reactive({
    if (input$dataset == "iris") {
      return(iris)
    } else if (input$dataset == "mtcars") {
      return(mtcars)
    } else {
      return(as.data.frame(Titanic))
    }
  })
  
  res <- callModule(module = filterDataServer, 
                    id = "ex", data = data)
  
  observeEvent(res$data, {
    updateProgressBar(
      session = session, id = "pbar", 
      value = nrow(res$data), total = nrow(data())
    )
  })
  
  output$tab <- DT::renderDataTable(res$data)
  
  output$code <- renderPrint(res$code)
  
}

shinyApp(ui, server)
}




