library(jsmodule)


### Name: logisticModule2
### Title: logisticModule2: Shiny modulde server for logistic regression
###   for reactive data.
### Aliases: logisticModule2

### ** Examples

library(shiny);library(DT);library(data.table);library(jstable)
ui <- fluidPage(
   sidebarLayout(
   sidebarPanel(
     regressModuleUI("logistic")
   ),
   mainPanel(
     DTOutput("logistictable")
   )
 )
)

server <- function(input, output, session) {

  data <- reactive(mtcars)
  data.label <- reactive(jstable::mk.lev(mtcars))

  out_logistic <- callModule(logisticModule2, "logistic", data = data, data_label = data.label,
                           data_varStruct = NULL)

  output$logistictable <- renderDT({
    datatable(out_logistic()$table, rownames=T, caption = out_logistic()$caption)
  })
}



