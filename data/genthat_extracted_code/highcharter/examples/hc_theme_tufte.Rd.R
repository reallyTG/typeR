library(highcharter)


### Name: hc_theme_tufte
### Title: Tufte theme for highcharts
### Aliases: hc_theme_tufte hc_theme_tufte2

### ** Examples


n <- 15
dta <- dplyr::data_frame(
  x = rnorm(n),
  y = 1.5 * x + rnorm(n))
highchart() %>%
  hc_chart(type = "scatter") %>% 
  hc_add_series(data = list_parse(dta)) %>% 
  hc_add_theme(hc_theme_tufte())
  

values <- 1 + abs(rnorm(12))
highchart() %>%
  hc_chart(type = "columnn") %>%
  hc_add_series(data = values) %>%
  hc_xAxis(categories = month.abb) %>%
  hc_add_theme(hc_theme_tufte2())




