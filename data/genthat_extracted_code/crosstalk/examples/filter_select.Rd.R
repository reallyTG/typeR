library(crosstalk)


### Name: filter_select
### Title: Categorical filter controls
### Aliases: filter_checkbox filter_select

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

sd <- SharedData$new(chickwts)
filter_select("feedtype", "Feed type", sd, "feed")

}




