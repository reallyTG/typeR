library(metricsgraphics)


### Name: mjs_bar
### Title: metricsgraphics.js bar chart "geom"
### Aliases: mjs_bar

### ** Examples

data.frame(year=seq(1790, 1970, 10),
           uspop=as.numeric(uspop)) %>%
  mjs_plot(x=year, y=uspop, width=300, height=400) %>%
  mjs_bar()




