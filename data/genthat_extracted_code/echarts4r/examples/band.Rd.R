library(echarts4r)


### Name: band
### Title: Confidence bands
### Aliases: band e_band e_band_

### ** Examples

df <- data.frame(
  x = 1:10,
  y = runif(10, 5, 10)
) %>% 
  dplyr::mutate(
    lwr = y - runif(10, 1, 3),
    upr = y + runif(10, 2, 4)
  )

df %>% 
  e_charts(x) %>% 
  e_line(y) %>% 
  e_band(lwr, upr)




