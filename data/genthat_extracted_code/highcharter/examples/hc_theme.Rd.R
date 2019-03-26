library(highcharter)


### Name: hc_theme
### Title: Highchart theme constructor
### Aliases: hc_theme

### ** Examples


hc <- highcharts_demo()

hc

thm <- hc_theme(
 colors = c('red', 'green', 'blue'),
 chart = list(
 backgroundColor = "#15C0DE"
 ),
 title = list(
   style = list(
     color = '#333333',
     fontFamily = "Erica One"
   )
 ),
 subtitle = list(
   style = list(
     color = '#666666',
     fontFamily = "Shadows Into Light"
   )
 ),
 legend = list(
   itemStyle = list(
     fontFamily = 'Tangerine',
     color = 'black'
   ),
   itemHoverStyle = list(
     color = 'gray'
   )   
  )
)

hc %>% hc_add_theme(thm)




