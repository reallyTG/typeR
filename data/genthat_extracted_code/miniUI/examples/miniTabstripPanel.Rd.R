library(miniUI)


### Name: miniTabstripPanel
### Title: Create a tabstrip panel
### Aliases: miniTabPanel miniTabstripPanel

### ** Examples

library(shiny)

miniTabstripPanel(
  miniTabPanel("Data", icon = icon("table"),
    selectInput("dataset", "Data set", ls("package:datasets"))),
  miniTabPanel("Subset", icon = icon("sliders"),
    uiOutput("subset_ui")
  )
)




