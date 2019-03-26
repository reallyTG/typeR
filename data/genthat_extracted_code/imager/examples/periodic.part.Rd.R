library(imager)


### Name: periodic.part
### Title: Compute the periodic part of an image, using the periodic/smooth
###   decomposition of Moisan (2011)
### Aliases: periodic.part

### ** Examples

im <- load.example("parrots") %>% subim(x <= 512)
layout(t(1:3))
plot(im,main="Original image")
periodic.part(im) %>% plot(main="Periodic part")
#The smooth error is the difference between
#the original image and its periodic part
(im-periodic.part(im)) %>% plot(main="Smooth part")




