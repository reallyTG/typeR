library(ezplot)


### Name: line_plot
### Title: line_plot
### Aliases: line_plot

### ** Examples


df = ez_data()
line_plot(df, "week", "value", use_theme = ggplot2::theme_bw)
line_plot(df, "week", c("Sales ($)" = "value"))
## No test: 
line_plot(df, "week", "value", "char")
line_plot(df, "week", "value", "char", "fct")
line_plot(df, "week", "value", "char", "fct", "num", facet_scales = "free_y")
line_plot(df, "year2", "~ value / units", "char", "fct", "num")
line_plot(df, "week", c("value", "units"))
line_plot(df, "week", "value", yoy = TRUE)
## End(No test)



