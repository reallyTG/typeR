library(maps)


### Name: world2
### Title: Pacific Centric Low resolution World Map
### Aliases: world2 world2MapEnv
### Keywords: datasets

### ** Examples

map('world2', xlim = c(100, 300))
map.axes()
# xlim is performed before wrapping:
map('world', wrap=c(0,360), xlim = c(100, 300))
# so to emulate "world2":
ww2 <- map('world', wrap=c(0,360), plot=FALSE, fill=TRUE)
map(ww2, xlim = c(100, 300), fill=TRUE)



