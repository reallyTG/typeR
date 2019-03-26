library(billboarder)


### Name: bb_proxy_data_names
### Title: Change names of the data with proxy
### Aliases: bb_proxy_data_names

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(billboarder)
##D 
##D ui <- fluidPage(
##D   tags$h2("Update axis title & data name (tooltip & legend)"),
##D   billboarderOutput(outputId = "my_bb"),
##D   textInput(
##D     inputId = "new_name",
##D     label = "New name :",
##D     value = "this is a new name",
##D     width = "100%"
##D   ),
##D   actionButton(
##D     inputId = "update",
##D     label = "Update chart",
##D     width = "100%"
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D   
##D   output$my_bb <- renderBillboarder({
##D     dat <- sample(letters[1:5], 100, TRUE)
##D     billboarder() %>%
##D       bb_barchart(data = table(dat)) %>% 
##D       bb_y_axis(label = list(text = "Freq"))
##D   })
##D   
##D   observeEvent(input$update, {
##D     dat <- sample(letters[1:5], 100, TRUE)
##D     billboarderProxy(shinyId = "my_bb") %>% 
##D       bb_proxy_axis_labels(y = input$new_name) %>% 
##D       bb_proxy_data_names(old = "Freq", 
##D                           new = input$new_name) %>% 
##D       bb_barchart(data = table(dat))
##D   }, ignoreInit = TRUE)
##D   
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



