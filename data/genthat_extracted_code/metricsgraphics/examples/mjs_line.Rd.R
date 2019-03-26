library(metricsgraphics)


### Name: mjs_line
### Title: metricsgraphics.js linechart "geom"
### Aliases: mjs_line

### ** Examples

data.frame(year=seq(1790, 1970, 10),
           uspop=as.numeric(uspop)) %>%
  mjs_plot(x=year, y=uspop) %>%
  mjs_line()




