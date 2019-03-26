library(forecast)


### Name: ggtsdisplay
### Title: Time series display
### Aliases: ggtsdisplay tsdisplay
### Keywords: ts

### ** Examples

library(ggplot2)
ggtsdisplay(USAccDeaths, plot.type="scatter", theme=theme_bw())

tsdisplay(diff(WWWusage))
ggtsdisplay(USAccDeaths, plot.type="scatter")




