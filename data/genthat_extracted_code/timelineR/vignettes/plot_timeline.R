## ------------------------------------------------------------------------
library(dplyr, quietly = T)
data_path <- system.file("extdata/delhi_air_pollution.csv", package = "timelineR")
air_pollution <- read.csv(data_path) %>% mutate(date = as.POSIXct(date)) %>% filter(date < as.POSIXct("2016-05-01"))
air_pollution$date = as.POSIXct(air_pollution$date)
str(air_pollution)

## ---- fig.width=8, fig.height=10-----------------------------------------
require(timelineR)
plot_grob <- plot_timeline(air_pollution)

## ---- fig.width=8, fig.height=4------------------------------------------
data_cols = c("pm10", "no")
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols)

## ---- fig.width=8, fig.height=4------------------------------------------
data_cols = c("pm10", "no")
start_time = as.POSIXct("2016-03-05")
end_time = as.POSIXct("2016-03-10")
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, start_time = start_time, end_time = end_time)

## ---- fig.width=8, fig.height=4------------------------------------------
data_cols = c("pm10", "no")
start_time = as.POSIXct("2016-03-05")
end_time = as.POSIXct("2016-03-10")
ylimits = list("pm10" = c(120,180))
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, start_time = start_time,
                           end_time = end_time, ylimits = ylimits)

## ---- fig.width=8, fig.height=5------------------------------------------
data_cols = c("pm10", "no", "odd_even")
scale_vals = c("pm10" = 0.5, "no" = 2)
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, scale_vals = scale_vals)

## ---- fig.width=8, fig.height=4------------------------------------------
data_cols = c("pm10", "odd_even")
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, add_legend = F)

## ---- fig.width=8, fig.height=2------------------------------------------
data_cols = c("odd_even")
color_mapping = list("odd_even" = c("NORMAL" = "#E67E22", "ODD-EVEN" = "green4"))
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, color_mapping = color_mapping)

## ---- fig.width=8, fig.height=2------------------------------------------
data_cols = c("pm10")
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, numeric_plot_type = "step")

## ---- fig.width=8, fig.height=2------------------------------------------
data_cols = c("co")
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, numeric_plot_type = "point")

## ---- fig.width=8, fig.height=6------------------------------------------
data_cols = c("co", "pm25", "odd_even")
ylabels = c("pm25" = "concentration", "odd_even" = "day type")
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, ylabels = ylabels)

## ---- fig.width=8, fig.height=6------------------------------------------
data_cols = c("co", "pm25", "odd_even")
ylabels = c("pm25" = "concentration", "odd_even" = "day type")
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, ylabels = ylabels, plot_output = F)

## ---- fig.width=8, fig.height=6------------------------------------------
data_cols = c("pm25", "odd_even")
overlapping_plot_names = list("pm25_with_odd_even" = c("odd_even", "pm25"))
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, overlap_plots_names = overlapping_plot_names)

## ---- fig.width=8, fig.height=6------------------------------------------
data_cols = c("pm25", "odd_even")
titles = c("pm25" = "Concentration of particulate 2.5 matter", "pm25_with_odd_even" = "Study of concentration of PM 2.5 matter with odd-even policy")
overlapping_plot_names = list("pm25_with_odd_even" = c("odd_even", "pm25"))
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, overlap_plots_names = overlapping_plot_names, titles = titles)

## ---- fig.width=8, fig.height=6------------------------------------------
data_cols = c("pm25", "odd_even")
titles = c("pm25" = "Concentration of particulate 2.5 matter", "pm25_with_odd_even" = "Study of concentration of PM 2.5 matter with odd-even policy")
overlapping_plot_names = list("pm25_with_odd_even" = c("odd_even", "pm25"))
order_plots = c("pm25_with_odd_even", "pm25")
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, overlap_plots_names = overlapping_plot_names, titles = titles, order_plots = order_plots)

## ---- fig.width=8, fig.height=7------------------------------------------
data_cols = c("pm25", "odd_even")
titles = c("pm25" = "Concentration of particulate 2.5 matter", "pm25_with_odd_even" = "Study of concentration of PM 2.5 matter with odd-even policy")
overlapping_plot_names = list("pm25_with_odd_even" = c("odd_even", "pm25"))
plot_size_ratios = c("pm25_with_odd_even" = 2, "odd_even" = 0.5)
plot_grob <- plot_timeline(air_pollution, data_cols = data_cols, overlap_plots_names = overlapping_plot_names, titles = titles, plot_size_ratios = plot_size_ratios)

## ------------------------------------------------------------------------
data_path <- system.file("extdata/test_data.csv", package = "timelineR")
test_data <- read.csv(data_path)
test_data %>% str

## ------------------------------------------------------------------------
grep_vec = c("state" = 1, "num" = 2)
match_grep(grep_vec, names(test_data))

## ------------------------------------------------------------------------
grep_vec = c("state" , "num")
match_grep(grep_vec, names(test_data), use_values = T)

## ------------------------------------------------------------------------
grep_vec = c("state" , "num")
match_grep(grep_vec, names(test_data), use_values = T, return_names = T)

## ------------------------------------------------------------------------
grep_vec = c("state" , "num")
match_grep(grep_vec, names(test_data), use_values = T, return_names = T, echo = T)

