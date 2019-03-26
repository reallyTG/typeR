library(highcharter)


### Name: hc_theme_538
### Title: Fivethirtyeight theme for highcharts
### Aliases: hc_theme_538

### ** Examples


highcharts_demo() %>% 
  hc_add_theme(hc_theme_538())
   
highcharts_demo() %>%
  hc_add_theme(
    hc_theme_538(
      colors = c("red", "blue", "green"),
      chart = list(backgroundColor = "white")
    )
  )




