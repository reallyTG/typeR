library(imager)


### Name: clean
### Title: Clean up and fill in pixel sets (morphological opening and
###   closing)
### Aliases: clean fill

### ** Examples

im <- load.example("birds") %>% grayscale
sub <- imsub(-im,y> 380) %>% threshold("85%")
plot(sub)
#Turn into a pixel set
px <- sub==1
layout(t(1:2))
plot(px,main="Before clean-up")
clean(px,3) %>% plot(main="After clean-up")
#Now fill in the holes
px <- clean(px,3)
plot(px,main="Before filling-in")
fill(px,28) %>% plot(main="After filling-in")



