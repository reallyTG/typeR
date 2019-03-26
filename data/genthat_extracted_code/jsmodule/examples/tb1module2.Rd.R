library(jsmodule)


### Name: tb1module2
### Title: tb1module: table 1 shiny module server for reactive data.
### Aliases: tb1module2

### ** Examples

library(shiny);library(DT);library(data.table);library(jstable)
ui <- fluidPage(
   sidebarLayout(
   sidebarPanel(
     tb1moduleUI("tb1")
   ),
   mainPanel(
     DTOutput("table1")
   )
 )
)

server <- function(input, output, session) {

  data <- reactive(mtcars)
  data.label <- reactive(jstable::mk.lev(mtcars))

  out_tb1 <- callModule(tb1module2, "tb1", data = data, data_label = data.label,
                        data_varStruct = NULL)

  output$table1 <- renderDT({
  tb <- out_tb1()$table
  cap <- out_tb1()$caption
  out.tb1 <- datatable(tb, rownames = T, extension= "Buttons", caption = cap)
  return(out.tb1)
  })
}



