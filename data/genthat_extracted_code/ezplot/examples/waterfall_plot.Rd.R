library(ezplot)


### Name: waterfall_plot
### Title: waterfall_plot
### Aliases: waterfall_plot

### ** Examples

df = ez_data()
waterfall_plot(df, "year", "units", "fct")
waterfall_plot(df, "year", "units", "char")
waterfall_plot(df, "year", "units", "fct", n_x = 3)
waterfall_plot(df, "year", "units", "fct",
               label_rescale = 0.5,
               ingroup_label = TRUE,
               bottom_label = FALSE,
               n_x = 3,
               size = 20,
               y_min = 0,
               rotate_xlabel = TRUE)



