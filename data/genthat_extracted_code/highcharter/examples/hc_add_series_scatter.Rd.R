library(highcharter)


### Name: hc_add_series_scatter
### Title: Shortcut for create scatter plots
### Aliases: hc_add_series_scatter

### ** Examples


## Not run: 
##D hc <- highchart()
##D 
##D hc_add_series_scatter(hc, mtcars$wt, mtcars$mpg)
##D hc_add_series_scatter(hc, mtcars$wt, mtcars$mpg, mtcars$drat)
##D hc_add_series_scatter(hc, mtcars$wt, mtcars$mpg, mtcars$drat, mtcars$am)
##D hc_add_series_scatter(hc, mtcars$wt, mtcars$mpg, mtcars$drat, mtcars$qsec)
##D hc_add_series_scatter(hc, mtcars$wt, mtcars$mpg, mtcars$drat, mtcars$qsec, rownames(mtcars))
##D 
##D # Add named attributes to data (attributes length needs to match number of rows)
##D hc_add_series_scatter(hc, mtcars$wt, mtcars$mpg, mtcars$drat, mtcars$qsec,
##D                       name = rownames(mtcars), gear = mtcars$gear) %>%
##D   hc_tooltip(pointFormat = "<b>{point.name}</b><br/>Gear: {point.gear}")
##D   
## End(Not run)




