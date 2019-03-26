library(expss)


### Name: htmlTable.etable
### Title: Outputting HTML tables in RStudio viewer/R Notebooks
### Aliases: htmlTable.etable htmlTable.with_caption htmlTable.list
###   knit_print.etable knit_print.with_caption repr_html.etable
###   repr_html.with_caption repr_text.etable repr_text.with_caption

### ** Examples

## Not run: 
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
##D expss_output_viewer()
##D mtcars %>% 
##D      tab_cols(total(), am %nest% vs) %>% 
##D      tab_cells(mpg, hp) %>% 
##D      tab_stat_mean() %>% 
##D      tab_cells(cyl) %>% 
##D      tab_stat_cpct() %>% 
##D      tab_pivot() %>% 
##D      set_caption("Table 1. Some variables from mtcars dataset.")
##D      
##D # several tables in a list
##D mtcars %>% 
##D     calc(list(
##D         cro_cpct(list(am, vs, cyl), list(total(), am)) %>% set_caption("Table 1. Percent."),   
##D         cro_mean_sd_n(list(mpg, hp, qsec), list(total(), am)) %>% set_caption("Table 2. Means.")
##D     )) %>% 
##D     htmlTable()
##D      
##D expss_output_default()   
##D  
## End(Not run)



