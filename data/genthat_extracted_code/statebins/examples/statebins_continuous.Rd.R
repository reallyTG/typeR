library(statebins)


### Name: statebins_continuous
### Title: Create a new ggplot-based "statebin" chart for USA states
###   (continuous scale)
### Aliases: statebins_continuous

### ** Examples

## Not run: 
##D data(USArrests)
##D USArrests$state <- rownames(USArrests)
##D statebins_continuous(USArrests, value_col="Murder", text_color="black", font_size=3,
##D                      legend_title = "Murder", legend_position="bottom")
## End(Not run)



