library(jsmodule)


### Name: regressModuleUI
### Title: regressModuleUI: shiny modulde UI for linear regression.
### Aliases: regressModuleUI

### ** Examples

library(shiny);library(DT);library(data.table);library(jstable)
ui <- fluidPage(
   sidebarLayout(
   sidebarPanel(
     regressModuleUI("linear")
   ),
   mainPanel(
     DTOutput("lineartable")
   )
 )
)

server <- function(input, output, session) {

  data <- reactive(mtcars)
  data.label <- reactive(jstable::mk.lev(mtcars))

  out_linear <- callModule(regressModule2, "linear", data = data, data_label = data.label,
                           data_varStruct = NULL)

  output$lineartable <- renderDT({
    datatable(out_linear()$table, rownames=T, caption = out_linear()$caption)
  })
}



