library(jsmodule)


### Name: coxModule
### Title: coxModule: shiny modulde server for Cox's model.
### Aliases: coxModule

### ** Examples

library(shiny);library(DT);library(data.table);library(jstable)
ui <- fluidPage(
   sidebarLayout(
   sidebarPanel(
     coxUI("cox")
   ),
   mainPanel(
     DTOutput("coxtable")
   )
 )
)

server <- function(input, output, session) {

  data <- reactive(mtcars)
  data.label <- reactive(jstable::mk.lev(mtcars))

  out_cox <- callModule(coxModule, "cox", data = data, data_label = data.label,
                           data_varStruct = NULL)

  output$coxtable <- renderDT({
    datatable(out_cox()$table, rownames=T, caption = out_cox()$caption)
  })
}



