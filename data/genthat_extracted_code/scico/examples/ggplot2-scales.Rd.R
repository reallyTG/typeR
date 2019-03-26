library(scico)


### Name: ggplot2-scales
### Title: Scales to use for ggplot2
### Aliases: ggplot2-scales scale_colour_scico scale_color_scico
###   scale_fill_scico scale_colour_scico_d scale_color_scico_d
###   scale_fill_scico_d

### ** Examples


if (require('ggplot2')) {
  volcano <- data.frame(
    x = rep(seq_len(ncol(volcano)), each = nrow(volcano)),
    y = rep(seq_len(nrow(volcano)), ncol(volcano)),
    height = as.vector(volcano)
  )
  
  ggplot(volcano, aes(x = x, y = y, fill = height)) + 
    geom_raster() + 
    scale_fill_scico(palette = 'tokyo') 
    
  ggplot(iris, aes(x=Petal.Width, y=Petal.Length)) +
    geom_point(aes(color=Species), size=10) + 
    scale_colour_scico_d() 
}






