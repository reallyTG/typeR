library(echarts4r)


### Name: e_cloud
### Title: Wordcloud
### Aliases: e_cloud e_cloud_

### ** Examples

words <- function(n = 5000) {
  a <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
  paste0(a, sprintf("%04d", sample(9999, n, TRUE)), sample(LETTERS, n, TRUE))
}

tf <- data.frame(terms = words(100), 
  freq = rnorm(100, 55, 10)) %>% 
  dplyr::arrange(-freq)

tf %>% 
  e_color_range(freq, color) %>% 
  e_charts() %>% 
  e_cloud(terms, freq, color, shape = "circle", sizeRange = c(3, 15))




