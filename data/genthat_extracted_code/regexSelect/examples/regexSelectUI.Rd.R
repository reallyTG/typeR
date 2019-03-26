library(regexSelect)


### Name: regexSelectUI
### Title: Create UI object for a selectize list input control with regular
###   expression capabilities
### Aliases: regexSelectUI

### ** Examples

if(interactive()){
ui <- shiny::fluidPage(
regexSelectUI(id = "a", label = "Variable:",choices = names(iris)),
shiny::tableOutput("data")
)


ui.show <- shiny::fluidPage(
regexSelectUI(id = "a", label = "Variable:",choices = names(iris),checkbox.show = TRUE),
shiny::tableOutput("data")
)

server <- function(input, output, session) {
 curr_cols<-shiny::callModule(regexSelect, "a",shiny::reactive(names(iris)))
 
 shiny::observeEvent(curr_cols(),{
 cols_now<-curr_cols()
 if(length(cols_now)==0)  cols_now<-names(data())
 output$data <- shiny::renderTable({iris[,cols_now , drop = FALSE]}, rownames = TRUE)
 })
}

#do not show regex checkboxes
shiny::shinyApp(ui, server)

#show regex checkboxes
shiny::shinyApp(ui.show, server)
 }



