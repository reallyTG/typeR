library(shiny)


### Name: navlistPanel
### Title: Create a navigation list panel
### Aliases: navlistPanel

### ** Examples

fluidPage(

  titlePanel("Application Title"),

  navlistPanel(
    "Header",
    tabPanel("First"),
    tabPanel("Second"),
    tabPanel("Third")
  )
)



