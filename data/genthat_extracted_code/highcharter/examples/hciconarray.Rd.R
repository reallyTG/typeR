library(highcharter)


### Name: hciconarray
### Title: Shortcut to make icon arrays charts
### Aliases: hciconarray

### ** Examples


hciconarray(c("nice", "good"), c(10, 20))

hciconarray(c("nice", "good"), c(10, 20), size = 10)

hciconarray(c("nice", "good"), c(100, 200), icons = "child")

 hciconarray(c("car", "truck", "plane"), c(75, 30, 20), icons = c("car", "truck", "plane")) %>%
   hc_add_theme(
     hc_theme_merge(
       hc_theme_flatdark(),
       hc_theme_null(chart = list(backgroundColor = "#34495e"))
     )
   )




