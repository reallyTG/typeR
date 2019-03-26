library(shinybootstrap2)


### Name: sidebarPanel
### Title: Create a sidebar panel
### Aliases: sidebarPanel

### ** Examples

# Sidebar with controls to select a dataset and specify
# the number of observations to view
sidebarPanel(
  selectInput("dataset", "Choose a dataset:",
              choices = c("rock", "pressure", "cars")),

  numericInput("obs", "Observations:", 10)
)



