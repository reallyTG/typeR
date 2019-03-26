library(imputeTestbench)


### Name: plot_errors
### Title: Function to plot the Error Comparison
### Aliases: plot_errors plot_errors.errprof

### ** Examples

aa <- impute_errors(dataIn = nottem)

# default plot
plot_errors(aa)
## Not run: 
##D # bar plot of averages at each repetition
##D plot_errors(aa, plotType = 'bar')
##D 
##D # line plot of averages at each repetition
##D plot_errors(aa, plotType = 'line')
##D 
##D # change the plot aesthetics
##D 
##D library(ggplot2)
##D p <- plot_errors(aa)
##D p + scale_fill_brewer(palette = 'Paired', guide_legend(title = 'Default'))
##D p + theme(legend.position = 'top')
##D p + theme_minimal()
##D p + ggtitle('Distribution of error for imputed values')
##D p + scale_y_continuous('RMSE')
## End(Not run)



