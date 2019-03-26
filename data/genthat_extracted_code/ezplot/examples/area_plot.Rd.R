library(ezplot)


### Name: area_plot
### Title: area_plot
### Aliases: area_plot

### ** Examples

## No test: 
df = ez_data()
area_plot(df, "year2", "units", size = 10)
area_plot(df, "year2", "units", "fct", use_theme = ggplot2::theme_bw)
area_plot(df, "year2", "units", "fct", reorder = NULL)
area_plot(df, "year2", "units", "fct", position = "fill")
area_plot(df, "year2", c("Unit Sales" = "units"), size = 12)
area_plot(df, "year2", c("Unit Sales" = "units"), "fct", "char")
area_plot(df, "year2", "units", "fct", "char", "num", position = "fill")
area_plot(df, "as.character(year)", "units")
## End(No test)



