library(shinybootstrap2)


### Name: column
### Title: Create a column within a UI definition
### Aliases: column

### ** Examples

library(shiny)

fluidRow(
  column(4,
    sliderInput("obs", "Number of observations:",
                min = 1, max = 1000, value = 500)
  ),
  column(8,
    plotOutput("distPlot")
  )
)

fluidRow(
  column(width = 4,
    "4"
  ),
  column(width = 3, offset = 2,
    "3 offset 2"
  )
)



