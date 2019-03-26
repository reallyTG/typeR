library(secrlinear)


### Name: networkdistance
### Title: Network Distances
### Aliases: networkdistance
### Keywords: manip

### ** Examples


x <- seq(0, 4*pi, length = 200)
xy <- data.frame(x = x*100, y = sin(x)*300)
mask <- read.linearmask(data = xy, spacing = 20)
trps <- make.line(mask, n = 15, startbuffer = 1000, by = 30)

## networkdistance; geometry in 'mask'
d <- networkdistance (trps, mask, mask)
dim(d)
head(d)




