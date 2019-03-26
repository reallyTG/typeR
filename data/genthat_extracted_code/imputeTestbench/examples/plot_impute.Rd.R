library(imputeTestbench)


### Name: plot_impute
### Title: Plot imputations
### Aliases: plot_impute

### ** Examples

# default
plot_impute(dataIn = nottem)

# change missing percent total
plot_impute(dataIn = nottem, missPercent = 10)

# show missing values
plot_impute(dataIn = nottem, showmiss = TRUE)

# use mar sampling
plot_impute(dataIn = nottem, smps = 'mar')

# change the plot aesthetics
## Not run: 
##D library(ggplot2)
##D p <- plot_impute(dataIn = nottem, smps = 'mar')
##D p + scale_colour_manual(values = c('black', 'grey'))
##D p + theme_minimal()
##D p + ggtitle('Imputation examples with different methods')
##D p + scale_y_continuous('Temp at Nottingham Castle (F)')
## End(Not run)



