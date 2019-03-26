library(easyalluvial)


### Name: alluvial_long
### Title: alluvial plot of data in long format
### Aliases: alluvial_long

### ** Examples



 data = quarterly_flights

 alluvial_long( data, key = qu, value = mean_arr_delay, id = tailnum, fill_by = 'last_variable' )

## Not run: 
##D  # more flow coloring variants ------------------------------------
##D 
##D  alluvial_long( data, key = qu, value = mean_arr_delay, id = tailnum, fill_by = 'first_variable' )
##D  alluvial_long( data, key = qu, value = mean_arr_delay, id = tailnum, fill_by = 'all_flows' )
##D  alluvial_long( data, key = qu, value = mean_arr_delay, id = tailnum, fill_by = 'value' )
##D 
##D  # color by additional variable carrier ---------------------------
##D 
##D  alluvial_long( data, key = qu, value = mean_arr_delay, fill = carrier, id = tailnum )
##D 
##D  # use same color coding for flows and y levels -------------------
##D 
##D  palette = c('green3', 'tomato')
##D 
##D  alluvial_long( data, qu, mean_arr_delay, tailnum, fill_by = 'value'
##D                 , col_vector_flow = palette
##D                 , col_vector_value = palette )
##D 
##D 
##D  # reorder levels ------------------------------------------------
##D 
##D  alluvial_long( data, qu, mean_arr_delay, tailnum, fill_by = 'first_variable'
##D                , order_levels_value = c('on_time', 'late') )
##D 
##D  alluvial_long( data, qu, mean_arr_delay, tailnum, fill_by = 'first_variable'
##D                , order_levels_key = c('Q4', 'Q3', 'Q2', 'Q1') )
##D 
##D require(dplyr)
##D require(magrittr)
##D 
##D  order_by_carrier_size = data %>%
##D    group_by(carrier) %>%
##D    count() %>%
##D    arrange( desc(n) ) %>%
##D    .[['carrier']]
##D 
##D  alluvial_long( data, qu, mean_arr_delay, tailnum, carrier
##D                 , order_levels_fill = order_by_carrier_size )
##D 
## End(Not run)



