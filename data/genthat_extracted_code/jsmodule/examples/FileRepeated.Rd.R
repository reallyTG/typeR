library(jsmodule)


### Name: FileRepeated
### Title: FileRepeated: File upload server module for repeated measure
###   analysis.
### Aliases: FileRepeated

### ** Examples

 library(shiny);library(DT);library(data.table);library(readxl);library(jstable)
 ui <- fluidPage(
   sidebarLayout(
     sidebarPanel(
       FileRepeatedInput("datafile")
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
   data <- callModule(FileRepeated, "datafile")

   output$data <- renderDT({
     data()$data
   })

   output$label <- renderDT({
     data()$label
   })
 }



