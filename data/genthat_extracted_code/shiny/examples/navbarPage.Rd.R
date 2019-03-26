library(shiny)


### Name: navbarPage
### Title: Create a page with a top level navigation bar
### Aliases: navbarPage navbarMenu

### ** Examples

navbarPage("App Title",
  tabPanel("Plot"),
  tabPanel("Summary"),
  tabPanel("Table")
)

navbarPage("App Title",
  tabPanel("Plot"),
  navbarMenu("More",
    tabPanel("Summary"),
    "----",
    "Section header",
    tabPanel("Table")
  )
)



