library(jsmodule)


### Name: FileSurveyInput
### Title: FileSurveyInput: File upload UI for survey data analysis.
### Aliases: FileSurveyInput

### ** Examples

 library(shiny);library(DT);library(data.table);library(readxl);library(jstable)
 ui <- fluidPage(
   sidebarLayout(
     sidebarPanel(
       FileSurveyInput("datafile")
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
   data <- callModule(FileSurvey, "datafile")

   output$data <- renderDT({
     data()$data
   })

   output$label <- renderDT({
     data()$label
   })
 }



