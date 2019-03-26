library(PKPDmisc)


### Name: print_plots
### Title: create a list of plots cleanly with extra pdf functionality
### Aliases: print_plots

### ** Examples

## Not run: 
##D library(dplyr)
##D library(PKPDmisc)
##D 
##D # given we may only plot a subset of individuals per plot
##D # and generate multiple plots, lets split the dataframe 
##D list_of_ids <- sd_oral_richpk %>% capitalize_names() %>%
##D mutate(plotnum = ids_per_plot(ID)) %>% # default 9 per plot
##D split(.$plotnum)
##D 
##D # now we want to plot each subplot
##D plot_list <- list_of_ids %>%
##D lapply(function(df) {
##D  df %>%
##D    ggplot(aes(x = TIME, y = CONC, group = ID)) +
##D    geom_line() + facet_wrap(~ID)
##D })
##D 
##D # to print these out (with one plot per page on pdf)
##D print_plots(plot_list)
## End(Not run)



