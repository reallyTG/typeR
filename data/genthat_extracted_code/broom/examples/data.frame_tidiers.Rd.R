library(broom)


### Name: data.frame_tidiers
### Title: Tidiers for data.frame objects
### Aliases: data.frame_tidiers tidy.data.frame glance.data.frame

### ** Examples


## Not run: 
##D td <- tidy(mtcars)
##D td
##D 
##D glance(mtcars)
##D 
##D library(ggplot2)
##D # compare mean and standard deviation
##D ggplot(td, aes(mean, sd)) + geom_point() +
##D      geom_text(aes(label = column), hjust = 1, vjust = 1) +
##D      scale_x_log10() + scale_y_log10() + geom_abline()
## End(Not run)




