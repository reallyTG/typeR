library(rPackedBar)


### Name: plotly_packed_bar
### Title: Create a 'plotly' packed bar chart
### Aliases: plotly_packed_bar

### ** Examples

## Not run: 
##D data(GNI2014, package = 'treemap')
##D 
##D data.table::setDT(GNI2014)
##D my_input_data = GNI2014[,sum(population), by=country]
##D 
##D plotly_packed_bar(my_input_data,
##D                   label_column    = 'country',
##D                   value_column    = 'V1',
##D                   plot_title      = 'Population 2014',
##D                   xaxis_label     = 'Population',
##D                   hover_label     = 'Population',
##D                   min_label_width = .025,
##D                   color_bar_color ='orange')
## End(Not run)



