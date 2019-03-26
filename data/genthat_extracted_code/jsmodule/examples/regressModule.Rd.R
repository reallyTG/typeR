library(jsmodule)


### Name: regressModule
### Title: regressModule: Shiny modulde server for linear regression.
### Aliases: regressModule

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

  data <- mtcars
  data.label <- jstable::mk.lev(mtcars)

  out_linear <- callModule(regressModule, "linear", data = data, data_label = data.label,
                           data_varStruct = NULL)

  output$lineartable <- renderDT({
    datatable(out_linear()$table, rownames=T, caption = out_linear()$caption)
  })
}



