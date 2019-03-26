library(RStoolbox)


### Name: histMatch
### Title: Image to Image Contrast Matching
### Aliases: histMatch

### ** Examples

library(ggplot2)
library(raster)
data(rlogo)
## Original image a (+1 to prevent log(0))
img_a <-  rlogo + 1 
## Degraded image b
img_b <- log(img_a)
## Cut-off half the image (just for better display)
img_b[, 1:50] <- NA

## Compare Images before histMatching
ggRGB(img_a,1,2,3)+
        ggRGB(img_b, 1,2,3, ggLayer = TRUE, stretch = "lin", q = 0:1) +
        geom_vline(aes(xintercept = 50))+
        ggtitle("Img_a vs. Img_b")

## Do histogram matching
img_b_matched <- histMatch(img_b, img_a)

## Compare Images after histMatching
ggRGB(img_a, 1, 2, 3)+
        ggRGB(img_b_matched, 1, 2, 3, ggLayer = TRUE, stretch = "lin", q = 0:1) +
        geom_vline(aes(xintercept = 50))+
        ggtitle("Img_a vs. Img_b_matched")

## Histogram comparison
opar <- par(mfrow = c(1, 3), no.readonly = TRUE)
img_a[,1:50] <- NA
redLayers <- stack(img_a, img_b, img_b_matched)[[c(1,4,7)]]
names(redLayers) <- c("img_a", "img_b", "img_b_matched")

hist(redLayers) 
## Reset par 
par(opar)



