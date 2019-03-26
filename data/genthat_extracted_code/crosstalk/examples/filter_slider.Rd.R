library(crosstalk)


### Name: filter_slider
### Title: Range filter control
### Aliases: animation_options filter_slider

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

sd <- SharedData$new(mtcars)
filter_slider("mpg", "Miles per gallon", sd, "mpg")

}



