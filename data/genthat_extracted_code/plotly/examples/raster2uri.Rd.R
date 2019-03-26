library(plotly)


### Name: raster2uri
### Title: Convert a raster object to a data URI
### Aliases: raster2uri

### ** Examples


# a red gradient (from ?as.raster)
r <- as.raster(matrix(hcl(0, 80, seq(50, 80, 10)), nrow = 4, ncol = 5))
plot(r)

# embed the raster as an image
plot_ly(x = 1, y = 1) %>% 
  layout(
    images = list(list(
     source = raster2uri(r),
     xref = "paper", 
     yref = "paper", 
     x = 0, y = 0, 
     sizex = 0.5, sizey = 0.5, 
     xanchor = "left", yanchor = "bottom"
  ))
 ) 



