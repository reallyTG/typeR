library(mwshiny)


### Name: mwsApp
### Title: Runs shiny app in multiple specified windows.
### Aliases: mwsApp

### ** Examples

if(interactive()){
# Run a simple 2-window app, initially bringing up the window selector window:
ui_win <- list()
ui_win[[1]] <- fluidPage(numericInput(inputId = "click", label = "a", value = 1))
ui_win[[2]] <- fluidPage(plotOutput("clickplot"))
serv_out <- list()
serv_out[["clickplot"]] <- function(input, calc){
  renderPlot({
      plot(1:input$click,1:input$click)
  })
}
mwsApp(c("clickinput","clickoutput"),
    ui_win,
    list(),
    serv_out)
}



