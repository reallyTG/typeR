library(highcharter)


### Name: hc_xAxis
### Title: Setting axis options to highchart objects
### Aliases: hc_xAxis hc_yAxis hc_yAxis_multiples hc_zAxis

### ** Examples


highchart() %>% 
  hc_add_series(data = c(7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2,
                        26.5, 23.3, 18.3, 13.9, 9.6),
                        type = "spline") %>% 
  hc_xAxis(title = list(text = "x Axis at top"),
         opposite = TRUE,
         plotLines = list(
           list(label = list(text = "This is a plotLine"),
                color = "#'FF0000",
                width = 2,
                value = 5.5))) %>% 
  hc_yAxis(title = list(text = "y Axis at right"),
           opposite = TRUE,
           minorTickInterval = "auto",
           minorGridLineDashStyle = "LongDashDotDot",
           showFirstLabel = FALSE,
           showLastLabel = FALSE,
           plotBands = list(
             list(from = 25, to = 80, color = "rgba(100, 0, 0, 0.1)",
                  label = list(text = "This is a plotBand")))) 
                  
 highchart() %>% 
   hc_yAxis_multiples(
     list(top = "0%", height = "30%", lineWidth = 3),
     list(top = "30%", height = "70%", offset = 0,
          showFirstLabel = FALSE, showLastLabel = FALSE)
   ) %>% 
   hc_add_series(data = rnorm(10)) %>% 
   hc_add_series(data = rexp(10), type = "spline", yAxis = 1)
            



