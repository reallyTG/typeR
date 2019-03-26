library(jsmodule)


### Name: csvFile
### Title: csvFile: Shiny module Server for file upload.
### Aliases: csvFile

### ** Examples

library(shiny);library(DT);library(data.table);library(readxl);library(jstable)
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      csvFileInput("datafile")
    ),
    mainPanel(
      tabsetPanel(type = "pills",
                  tabPanel("Data", DTOutput("data")),
                  tabPanel("Label", DTOutput("data_label", width = "100%"))
                 )
   )
 )
)

server <- function(input, output, session) {
  data <- callModule(csvFile, "datafile")

  output$data <- renderDT({
    data()$data
  })

  output$label <- renderDT({
    data()$label
  })
}



