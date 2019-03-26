library(jsmodule)


### Name: ggpairsModule2
### Title: ggpairsModule2: shiny module server for basic/scatter plot for
###   reactive data.
### Aliases: ggpairsModule2

### ** Examples

library(shiny);library(DT);library(data.table);library(jstable);library(ggplot2)
library(GGally)

ui <- fluidPage(
   sidebarLayout(
   sidebarPanel(
     ggpairsModuleUI1("ggpairs")
   ),
   mainPanel(
     plotOutput("ggpairs_plot"),
     ggpairsModuleUI2("ggpairs")
   )
 )
)

server <- function(input, output, session) {

  data <- reactive(mtcars)
  data.label <- reactive(jstable::mk.lev(mtcars))

  out_ggpairs <- callModule(ggpairsModule2, "ggpairs", data = data, data_label = data.label,
                            data_varStruct = NULL)

  output$kaplan_plot <- renderPlot({
    print(out_ggpairs())
  })
}



