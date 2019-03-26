library(jsmodule)


### Name: ggplotdownUI
### Title: ggplotdownUI: Option & download module UI for ggplot
### Aliases: ggplotdownUI

### ** Examples

library(shiny);library(DT);library(data.table);library(jstable);library(ggplot2)
ui <- fluidPage(
   sidebarLayout(
   sidebarPanel(
     kaplanUI("kaplan")
   ),
   mainPanel(
     plotOutput("kaplan_plot"),
     ggplotdownUI("kaplan")
   )
 )
)

server <- function(input, output, session) {

  data <- reactive(mtcars)
  data.label <- reactive(jstable::mk.lev(mtcars))

  out_kaplan <- callModule(kaplanModule, "kaplan", data = data, data_label = data.label,
                           data_varStruct = NULL)

  output$kaplan_plot <- renderPlot({
    print(out_kaplan())
  })
}



