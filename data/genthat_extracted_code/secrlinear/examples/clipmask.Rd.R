library(secrlinear)


### Name: clipmask
### Title: Drop Points Distant From Detectors
### Aliases: clipmask
### Keywords: manip

### ** Examples

x <- seq(0, 4*pi, length = 200)
xy <- data.frame(x = x*100, y = sin(x)*300)
mask <- read.linearmask(data = xy, spacing = 20)

## clipmask
trps <- make.line(mask, n = 15, startbuffer = 1000, by = 30)
newmask <- clipmask(mask, trps, buffer = 200)
plot(newmask)
plot(trps, add = TRUE)

if (require('rgeos')) {
  newmask <- clipmask(mask, trps, buffer = 200, clipvert = TRUE)
  plot(newmask)
  plot(trps, add = TRUE)
}




