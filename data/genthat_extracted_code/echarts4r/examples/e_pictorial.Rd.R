library(echarts4r)


### Name: e_pictorial
### Title: Pictorial
### Aliases: e_pictorial e_pictorial_

### ** Examples

# built-in symbols
y <- rnorm(10, 10, 2)
df <- data.frame(
  x = 1:10,
  y = y,
  z = y - rnorm(10, 5, 1)
)

df %>% 
  e_charts(x) %>% 
  e_bar(z, barWidth = 10) %>% 
  e_pictorial(y, symbol = "rect", symbolRepeat = TRUE, z = -1,
    symbolSize = c(10, 4)) %>% 
  e_theme("westeros")
  
# svg path
path <- "path://M0,10 L10,10 C5.5,10 5.5,5 5,0 C4.5,5 4.5,10 0,10 z"

style <- list(
  normal = list(opacity = 0.5), # normal
  emphasis = list(opacity = 1) # on hover
)

df %>% 
  e_charts(x) %>% 
  e_pictorial(y, symbol = path, barCategoryGap = "-130%",
    itemStyle = style) 
    
# image
# might not work in RStudio viewer
# open in browser
qomo <- paste0(
  "https://ecomfe.github.io/echarts-examples/public/",
  "data/asset/img/hill-Qomolangma.png"
)

kili <- paste0(
  "https://ecomfe.github.io/echarts-examples/public/", 
  "data/asset/img/hill-Kilimanjaro.png"
)

data <- data.frame(
  x = c("Qomolangma", "Kilimanjaro"), 
  value = c(8844, 5895),
  symbol = c(paste0("image://", qomo),
    paste0("image://", kili))
)

data %>% 
  e_charts(x) %>% 
  e_pictorial(value, symbol) %>% 
  e_legend(FALSE) 




