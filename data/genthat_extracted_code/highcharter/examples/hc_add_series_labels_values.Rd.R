library(highcharter)


### Name: hc_add_series_labels_values
### Title: Shortcut for add series for pie, bar and columnn charts
### Aliases: hc_add_series_labels_values

### ** Examples

## Not run: 
##D data("favorite_bars")
##D data("favorite_pies")
##D 
##D highchart() %>% 
##D   hc_title(text = "This is a bar graph describing my favorite pies
##D                    including a pie chart describing my favorite bars") %>%
##D   hc_subtitle(text = "In percentage of tastiness and awesomeness") %>% 
##D   hc_add_series_labels_values(favorite_pies$pie, favorite_pies$percent, name = "Pie",
##D                              colorByPoint = TRUE, type = "columnn") %>% 
##D   hc_add_series_labels_values(favorite_bars$bar, favorite_bars$percent,
##D                              colors = substr(terrain.colors(5), 0 , 7), type = "pie",
##D                              name = "Bar", colorByPoint = TRUE, center = c('35%', '10%'),
##D                              size = 100, dataLabels = list(enabled = FALSE)) %>% 
##D   hc_yAxis(title = list(text = "percentage of tastiness"),
##D            labels = list(format = "{value}%"), max = 100) %>% 
##D   hc_xAxis(categories = favorite_pies$pie) %>% 
##D   hc_legend(enabled = FALSE) %>% 
##D   hc_tooltip(pointFormat = "{point.y}%")
## End(Not run)




