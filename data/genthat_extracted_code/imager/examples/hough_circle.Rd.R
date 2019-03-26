library(imager)


### Name: hough_circle
### Title: Circle detection using Hough transform
### Aliases: hough_circle

### ** Examples

im <- load.example('coins')
px <- cannyEdges(im)
#Find circles of radius 20
hc <- hough_circle(px,20)
plot(hc)
#Clean up, run non-maxima suppression
nms <- function(im,sigma) { im[dilate_square(im,sigma) != im] <- 0; im}
hc.clean <- isoblur(hc,3) %>% nms(50)
#Top ten matches
df <- as.data.frame(hc.clean) %>%
dplyr::arrange(desc(value)) %>% head(10)
with(df,circles(x,y,20,fg="red",lwd=3))



