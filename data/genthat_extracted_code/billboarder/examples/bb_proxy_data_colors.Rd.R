library(billboarder)


### Name: bb_proxy_data_colors
### Title: Change colors with proxy
### Aliases: bb_proxy_data_colors

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(billboarder)
##D 
##D ui <- fluidPage(
##D   tags$h2("Update colors"),
##D   fluidRow(
##D     column(
##D       width = 3,
##D       selectizeInput(
##D         inputId = "col_eol",
##D         label = "Color for 'prod_eolien':",
##D         choices = c("#66C2A5", "#FC8D62", 
##D                     "#8DA0CB", "#E78AC3",
##D                     "#A6D854", "#FFD92F", 
##D                     "#E5C494", "#B3B3B3")
##D       ),
##D       selectizeInput(
##D         inputId = "col_sol",
##D         label = "Color for 'prod_solaire':",
##D         choices = c("#66C2A5", "#FC8D62", 
##D                     "#8DA0CB", "#E78AC3",
##D                     "#A6D854", "#FFD92F", 
##D                     "#E5C494", "#B3B3B3")
##D       )
##D     ),
##D     column(
##D       width = 9,
##D       billboarderOutput(outputId = "my_bb")
##D     )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$my_bb <- renderBillboarder({
##D     data(prod_par_filiere)
##D     billboarder() %>%
##D       bb_barchart(
##D         data = prod_par_filiere[, c(1, 6, 8)]
##D       )
##D   })
##D 
##D   observe({
##D     billboarderProxy(shinyId = "my_bb") %>%
##D       bb_proxy_data_colors(
##D         names = c("prod_eolien", "prod_solaire"),
##D         colors = c(input$col_eol, input$col_sol)
##D       )
##D   })
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



