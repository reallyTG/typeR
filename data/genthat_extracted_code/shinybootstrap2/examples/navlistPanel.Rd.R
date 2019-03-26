library(shinybootstrap2)


### Name: navlistPanel
### Title: Create a navigation list panel
### Aliases: navlistPanel

### ** Examples

library(shiny)

fluidPage(

  titlePanel("Application Title"),

  navlistPanel(
    "Header",
    tabPanel("First"),
    tabPanel("Second"),
    "-----",
    tabPanel("Third")
  )
)



