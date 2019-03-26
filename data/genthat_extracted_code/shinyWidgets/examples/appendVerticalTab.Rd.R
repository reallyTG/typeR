library(shinyWidgets)


### Name: appendVerticalTab
### Title: Mutate Vertical Tabset Panel
### Aliases: appendVerticalTab removeVerticalTab reorderVerticalTabs

### ** Examples

if (interactive()) {
library(shiny)
library(shinyWidgets)

ui <- fluidPage(

  verticalTabsetPanel(
    verticalTabPanel("blaa","foo"),
    verticalTabPanel("yarp","bar"),
    id="hippi"
  )
)

server <- function(input, output, session) {
  appendVerticalTab("hippi", verticalTabPanel("bipi","long"))
  removeVerticalTab("hippi", 1)
  appendVerticalTab("hippi", verticalTabPanel("howdy","fair"))
  reorderVerticalTabs("hippi", c(3,2,1))
}

# Run the application
shinyApp(ui = ui, server = server)
}



