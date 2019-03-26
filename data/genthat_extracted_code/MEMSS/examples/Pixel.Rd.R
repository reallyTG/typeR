library(MEMSS)


### Name: Pixel
### Title: X-ray pixel intensities over time
### Aliases: Pixel
### Keywords: datasets

### ** Examples

options(show.signif.stars = FALSE)
str(Pixel)
summary(Pixel)
(fm1 <- lmer(pixel ~ day + I(day^2) + (1|Dog:Side) + (day|Dog), Pixel))



