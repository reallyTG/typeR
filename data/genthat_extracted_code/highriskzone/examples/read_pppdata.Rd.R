library(highriskzone)


### Name: read_pppdata
### Title: Read data, so it can be used for high-risk zone methodology.
### Aliases: read_pppdata

### ** Examples

data(craterA)
windowA <- data.frame(x = craterA$window$bdry[[1]]$x, y = craterA$window$bdry[[1]]$y)
patternA <- data.frame(x = craterA$x, y = craterA$y)
str(patternA)
str(windowA)
crater <- read_pppdata(xppp = patternA$x, yppp = patternA$y, 
                       xwin = windowA$x, ywin = windowA$y)
crater



