library(RLumShiny)


### Name: tooltip
### Title: Create a bootstrap tooltip
### Aliases: tooltip

### ** Examples

# javascript code
tt <- tooltip("elementId", "This is a tooltip.")
str(tt)

# example app
## Not run: 
##D shinyApp(
##D ui = fluidPage(
##D   jscolorInput(inputId = "col", label = "JSColor Picker", 
##D                value = "21BF6B", position = "right", 
##D                mode = "HVS", close = TRUE),
##D   tooltip("col", "This is a JScolor widget"),
##D   
##D   checkboxInput("cbox", "Checkbox", FALSE),
##D   tooltip("cbox", "This is a checkbox"),
##D   
##D   checkboxGroupInput("cboxg", "Checkbox group", selected = "a", 
##D                      choices = c("a" = "a",
##D                                  "b" = "b",
##D                                  "c" = "c")),
##D   tooltip("cboxg", "This is a <b>checkbox group</b>", html = TRUE),
##D   
##D   selectInput("select", "Selectinput", selected = "a", choices = c("a"="a", "b"="b")),
##D   tooltip("select", "This is a text input field", attr = "for", placement = "right"),
##D   
##D   passwordInput("pwIn", "Passwordinput"),
##D   tooltip("pwIn", "This is a password input field"),
##D   
##D   plotOutput("plot")
##D ),
##D server = function(input, output) {
##D   output$plot <- renderPlot({
##D     plot(cars, col = input$col, cex = 2, pch = 16)
##D  })
##D })
## End(Not run)



