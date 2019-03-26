library(shinymaterial)


### Name: material_spinner_show
### Title: Create a material preloader (spinner)
### Aliases: material_spinner_show material_spinner_hide

### ** Examples

if(interactive()){
  library(shiny)
  library(shinymaterial)
  
  ui <- material_page(
    title = "Spinner Example",
    numericInput(inputId = "n", label = "", value = 10),
    plotOutput("n_plot")
 )
  
  server <- function(input, output, session) {
    
    output$n_plot <- renderPlot({
    
      #--- Show the spinner ---#
      material_spinner_show(session, "n_plot")
      
      #--- Simulate calculation step ---#
      Sys.sleep(time = 5)
      
      #--- Hide the spinner ---#
      material_spinner_hide(session, "n_plot")
      
      plot(1:input$n)
    })
    
  }
  shinyApp(ui = ui, server = server)
}



