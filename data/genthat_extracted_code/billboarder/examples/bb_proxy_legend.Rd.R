library(billboarder)


### Name: bb_proxy_legend
### Title: Show or hide legend with proxy
### Aliases: bb_proxy_legend

### ** Examples

## Not run: 
##D 
##D library("shiny")
##D 
##D data("prod_par_filiere")
##D 
##D ui <- fluidPage(
##D   tags$h2("Show or hide legend with Proxy"),
##D   fluidRow(
##D     column(
##D       width = 3,
##D       checkboxInput(
##D         inputId = "show_legend", 
##D         label = "Show legend", 
##D         value = TRUE
##D       ),
##D       checkboxGroupInput(
##D         inputId = "item_show",
##D         label = "Item to show in legend", 
##D         choices = c("Hydraulic" = "prod_hydraulique", 
##D                     "Wind" = "prod_eolien", 
##D                     "Solar" = "prod_solaire"), 
##D         selected = c("prod_hydraulique", "prod_eolien", "prod_solaire")
##D       )
##D     ),
##D     column(
##D       width = 9,
##D       billboarderOutput(outputId = "mybb")
##D     )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D   
##D   output$mybb <- renderBillboarder({
##D     billboarder() %>%
##D       bb_barchart(
##D         data = prod_par_filiere[, c("annee", "prod_hydraulique", "prod_eolien", "prod_solaire")], 
##D         stacked = TRUE
##D       ) %>%
##D       bb_data(
##D         names = list(prod_hydraulique = "Hydraulic", prod_eolien = "Wind", prod_solaire = "Solar"), 
##D         labels = TRUE
##D       ) %>% 
##D       bb_colors_manual(
##D         "prod_eolien" = "#41AB5D", "prod_hydraulique" = "#4292C6", "prod_solaire" = "#FEB24C"
##D       ) %>%
##D       bb_y_grid(show = TRUE) %>%
##D       bb_y_axis(tick = list(format = suffix("TWh")),
##D                 label = list(text = "production (in terawatt-hours)", position = "outer-top")) %>% 
##D       bb_legend(position = "right") %>% 
##D       bb_labs(title = "Renewable energy production",
##D               caption = "Data source: RTE (https://opendata.rte-france.com)")
##D   })
##D   
##D   observe({
##D     if (input$show_legend) {
##D       billboarderProxy("mybb") %>% bb_proxy_legend(what = "show")
##D     } else {
##D       billboarderProxy("mybb") %>% bb_proxy_legend(what = "hide")
##D     }
##D   })
##D   
##D   observe({
##D     lapply(
##D       X = c("prod_hydraulique", "prod_eolien", "prod_solaire"),
##D       FUN = function(x) {
##D         if (x %in% input$item_show) {
##D           billboarderProxy("mybb") %>% bb_proxy_legend(what = "show", targetIds = x)
##D         } else {
##D           billboarderProxy("mybb") %>% bb_proxy_legend(what = "hide", targetIds = x)
##D         }
##D       }
##D     )
##D   })
##D   
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
## End(Not run)



