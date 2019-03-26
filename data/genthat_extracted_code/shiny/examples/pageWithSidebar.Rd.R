library(shiny)


### Name: pageWithSidebar
### Title: Create a page with a sidebar
### Aliases: pageWithSidebar

### ** Examples

# Define UI
pageWithSidebar(

  # Application title
  headerPanel("Hello Shiny!"),

  # Sidebar with a slider input
  sidebarPanel(
    sliderInput("obs",
                "Number of observations:",
                min = 0,
                max = 1000,
                value = 500)
  ),

  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
)



