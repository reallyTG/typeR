library(highcharter)


### Name: hc_colorAxis
### Title: Setting color Axis options to highchart objects Function to set
###   the axis color to highcharts objects.
### Aliases: hc_colorAxis

### ** Examples


nyears <- 5

df <- expand.grid(seq(12) - 1, seq(nyears) - 1)
df$value <- abs(seq(nrow(df)) + 10 * rnorm(nrow(df))) + 10
df$value <- round(df$value, 2)
ds <- list_parse2(df)


hc <- highchart() %>%
  hc_chart(type = "heatmap") %>%
  hc_title(text = "Simulated values by years and months") %>%
  hc_xAxis(categories = month.abb) %>%
  hc_yAxis(categories = 2016 - nyears + seq(nyears)) %>%
  hc_add_series(name = "value", data = ds)

hc_colorAxis(hc, minColor = "#FFFFFF", maxColor = "#434348")

hc_colorAxis(hc, minColor = "#FFFFFF", maxColor = "#434348",
             type = "logarithmic")


require("viridisLite")

n <- 4
stops <- data.frame(q = 0:n/n,
                    c = substring(viridis(n + 1), 0, 7),
                    stringsAsFactors = FALSE)
stops <- list_parse2(stops)

hc_colorAxis(hc, stops = stops, max = 75)




