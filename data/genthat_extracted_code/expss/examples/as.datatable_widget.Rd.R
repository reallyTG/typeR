library(expss)


### Name: as.datatable_widget
### Title: Create an HTML table widget for usage with Shiny
### Aliases: as.datatable_widget as.datatable_widget.etable
###   as.datatable_widget.with_caption

### ** Examples

## Not run: 
##D  
##D 
##D data(mtcars)
##D mtcars = apply_labels(mtcars,
##D                       mpg = "Miles/(US) gallon",
##D                       cyl = "Number of cylinders",
##D                       disp = "Displacement (cu.in.)",
##D                       hp = "Gross horsepower",
##D                       drat = "Rear axle ratio",
##D                       wt = "Weight (1000 lbs)",
##D                       qsec = "1/4 mile time",
##D                       vs = "Engine",
##D                       vs = c("V-engine" = 0,
##D                              "Straight engine" = 1),
##D                       am = "Transmission",
##D                       am = c("Automatic" = 0,
##D                              "Manual"=1),
##D                       gear = "Number of forward gears",
##D                       carb = "Number of carburetors"
##D )
##D 
##D mtcars_table = mtcars %>% 
##D                  tab_cols(total(), am %nest% vs) %>% 
##D                  tab_cells(mpg, hp) %>% 
##D                  tab_stat_mean() %>% 
##D                  tab_cells(cyl) %>% 
##D                  tab_stat_cpct() %>% 
##D                  tab_pivot() %>% 
##D                  set_caption("Table 1. Some variables from mtcars dataset.")
##D 
##D library(shiny)
##D shinyApp(
##D     ui = fluidPage(fluidRow(column(12, DT::dataTableOutput('tbl')))),
##D     server = function(input, output) {
##D         output$tbl = DT::renderDataTable(
##D             as.datatable_widget(mtcars_table)
##D         )
##D     }
##D )
## End(Not run)



