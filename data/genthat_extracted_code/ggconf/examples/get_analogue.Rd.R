library(ggconf)


### Name: get_analogue
### Title: return resulted strings of approximate string match
### Aliases: get_analogue

### ** Examples


get_analogue("axis.txt", c("axis.text", "axis.text.x", "axis.ticks"))
# returns "axis.text" "axis.text.x" "axis.ticks"

get_analogue("p.bg", c("plot.background", "panel.background"))
# returns "plot.background" as first, and then "panel.background"





