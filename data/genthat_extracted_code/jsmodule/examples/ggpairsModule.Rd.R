library(jsmodule)


### Name: ggpairsModule
### Title: ggpairsModule: shiny module server for basic/scatter plot.
### Aliases: ggpairsModule

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

  data <- mtcars
  data.label <- jstable::mk.lev(mtcars)

  out_ggpairs <- callModule(ggpairsModule, "ggpairs", data = data, data_label = data.label,
                            data_varStruct = NULL)

  output$kaplan_plot <- renderPlot({
    print(out_ggpairs())
  })
}



