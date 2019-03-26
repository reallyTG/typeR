library(shinycustomloader)


### Name: withLoader
### Title: Add a loader that shows when an output is recalculating
### Aliases: withLoader

### ** Examples

## Not run: withLoader(plotOutput("my_plot"))
## Not run: marquee_list <- list(marquee("Your custom text here"))
## Not run: withLoader(plotOutput("distPlot"), type="text", loader=marquee_list)



