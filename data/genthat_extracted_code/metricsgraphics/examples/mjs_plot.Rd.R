library(metricsgraphics)


### Name: mjs_plot
### Title: Create a new metricsgraphics.js plot
### Aliases: mjs_plot

### ** Examples

data.frame(year=seq(1790, 1970, 10),
           uspop=as.numeric(uspop)) %>%
  mjs_plot(x=year, y=uspop) %>%
  mjs_line()

# accessor params can also be quoted

data.frame(year=seq(1790, 1970, 10),
           uspop=as.numeric(uspop)) %>%
  mjs_plot(x="year", y="uspop") %>%
  mjs_line()




