library(magick)


### Name: edges
### Title: Edge / Line Detection
### Aliases: edges image_edge image_canny image_hough_draw image_hough_txt

### ** Examples

if(magick_config()$version > "6.8.9"){
shape <- demo_image("shape_rectangle.gif")
rectangle <- image_canny(shape)
rectangle %>% image_hough_draw('5x5+20')
rectangle %>% image_hough_txt(format = 'svg') %>% cat()
}



