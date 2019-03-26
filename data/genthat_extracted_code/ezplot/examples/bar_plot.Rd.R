library(ezplot)


### Name: bar_plot
### Title: bar_plot
### Aliases: bar_plot

### ** Examples

df = ez_data()
bar_plot(df, "year", "units")
bar_plot(df, "year", c("Share of Units" = "units"), "fct", position = "fill")
bar_plot(df, "year", "units", "fct", use_theme = ggplot2::theme_bw)
bar_plot(df, "year", "units", "fct", reorder = NULL, label_pos = "both")
bar_plot(df, "year", c(Units = "units"), "fct", "char")
bar_plot(df, "year", "units", "fct", "char", "num")
bar_plot(df, "year", "ifelse(fct == 'X', units, -units)", "fct", label_pos = "both")



