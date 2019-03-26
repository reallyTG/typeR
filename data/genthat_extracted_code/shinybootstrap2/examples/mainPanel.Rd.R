library(shinybootstrap2)


### Name: mainPanel
### Title: Create a main panel
### Aliases: mainPanel

### ** Examples

library(shiny)
# Show the caption and plot of the requested variable against mpg
mainPanel(
   h3(textOutput("caption")),
   plotOutput("mpgPlot")
)



