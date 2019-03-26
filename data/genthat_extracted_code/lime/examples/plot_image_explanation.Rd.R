library(lime)


### Name: plot_image_explanation
### Title: Display image explanations as superpixel areas
### Aliases: plot_image_explanation

### ** Examples


## Not run: 
##D # load precalculated explanation as it takes a long time to create
##D explanation <- .load_image_example()
##D 
##D # Default
##D plot_image_explanation(explanation)
##D 
##D # Block out background instead
##D plot_image_explanation(explanation, display = 'block')
##D 
##D # Show negatively correlated areas as well
##D plot_image_explanation(explanation, show_negative = TRUE)
## End(Not run)




