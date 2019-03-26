library(shiny)


### Name: tabsetPanel
### Title: Create a tabset panel
### Aliases: tabsetPanel

### ** Examples

# Show a tabset that includes a plot, summary, and
# table view of the generated distribution
mainPanel(
  tabsetPanel(
    tabPanel("Plot", plotOutput("plot")),
    tabPanel("Summary", verbatimTextOutput("summary")),
    tabPanel("Table", tableOutput("table"))
  )
)



