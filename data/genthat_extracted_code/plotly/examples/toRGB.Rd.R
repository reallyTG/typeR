library(plotly)


### Name: toRGB
### Title: Convert R colours to RGBA hexadecimal colour values
### Aliases: toRGB

### ** Examples


toRGB("steelblue") 
# [1] "rgba(70,130,180,1)"

m <- list(
  color = toRGB("red"),
  line = list(
    color = toRGB("black"), 
    width = 19
  )
)

plot_ly(x = 1, y = 1, marker = m)




