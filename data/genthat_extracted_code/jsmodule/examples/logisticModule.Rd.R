library(jsmodule)


### Name: logisticModule
### Title: logisticModule: Shiny modulde server for logistic regression.
### Aliases: logisticModule

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

  data <- mtcars
  data.label <- jstable::mk.lev(mtcars)

  out_logistic <- callModule(logisticModule, "logistic", data = data, data_label = data.label,
                           data_varStruct = NULL)

  output$logistictable <- renderDT({
    datatable(out_logistic()$table, rownames=T, caption = out_logistic()$caption)
  })
}



