library(billboarder)


### Name: bb_proxy_focus
### Title: Highlights specified targets and fade out the others.
### Aliases: bb_proxy_focus bb_proxy_defocus

### ** Examples

## Not run: 
##D if (interactive()) {
##D library("shiny")
##D library("billboarder")
##D 
##D ui <- fluidPage(
##D   tags$h1("Proxy method to highlight data"),
##D   checkboxGroupInput(
##D     inputId = "focus", 
##D     label = "Focus", 
##D     choices = c("setosa", "versicolor", "virginica"), 
##D     inline = TRUE
##D   ),
##D   billboarderOutput(outputId = "bb")
##D )
##D 
##D server <- function(input, output, session) {
##D   
##D   output$bb <- renderBillboarder({
##D     billboarder() %>% 
##D       bb_scatter(
##D         data = iris, 
##D         x = "Sepal.Length", 
##D         y = "Sepal.Width", 
##D         group = "Species"
##D       ) %>% 
##D       bb_axis(x = list(tick = list(fit = FALSE))) %>% 
##D       bb_point(r = 8)
##D   })
##D   
##D   observeEvent(input$focus, {
##D     billboarderProxy("bb") %>% 
##D       bb_proxy_focus(input$focus)
##D   }, ignoreNULL = FALSE)
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D }
## End(Not run)



