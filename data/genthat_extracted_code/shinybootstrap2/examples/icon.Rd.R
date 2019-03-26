library(shinybootstrap2)


### Name: icon
### Title: Create an icon
### Aliases: icon

### ** Examples

library(shiny)
icon("calendar")            # standard icon
icon("calendar", "fa-3x")   # 3x normal size

# add an icon to a submit button
submitButton("Update View", icon = icon("refresh"))

navbarPage("App Title",
  tabPanel("Plot", icon = icon("bar-chart-o")),
  tabPanel("Summary", icon = icon("list-alt")),
  tabPanel("Table", icon = icon("table"))
)



