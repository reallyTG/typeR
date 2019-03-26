library(qlcVisualize)


### Name: lmap
### Title: Drawing multi-level maps (e.g. semantic maps or linguistic
###   isoglosses)
### Aliases: lmap levelmap

### ** Examples

# isogloss example
# choose one feature from hessen dataset (number 4)
data(hessen)
f4 <- hessen$data[,9:13]

# look for area for interpolation, changing density and grid parameters
# suitable parameters can be passed through to function lmap below
boundary(hessen$villages, density = 0.1, grid = 10)

# useful size of pies has to be determined by changing cex
plot(hessen$boundary, main = NULL)
lmap(hessen$villages, f4, draw = 3, cex = 0.8
  , density = 0.1, grid = 10, add = TRUE, cex.legend = 0.5)

# another isogloss example:
# "f" sounds in German dialects in the words "Kochlöffel"
require(mapdata)
map("worldHires", "Germany", fill = TRUE, col = "grey90")

data(dialects)
lmap(dialects$villages, dialects$data[,21], levels = c(0.20, 0.22, 0.24)
    , add = TRUE, position = "topleft")
title(main = "f-sound in \'Kochlöffel\'")

# semantic map example
# location of points via multidimensional scaling of complete data
data(haspelmath)
d <- dist(haspelmath)
p <- MASS::isoMDS(d)$points

# testing boundary parameters
boundary(p)
boundary(p, density = 0.004, box = 0.15, tightness = 8)

# labels to be plotted instead of points
text <- gsub("\\.", "\n", rownames(haspelmath))

# show a few languages
# using a quick dummy function to set all parameters
tmp <- function(columns) {
  lmap(p, haspelmath[,columns]
    , levels = 0.1, labels = text
    , density = 0.004, box = 0.15, tightness = 8
    , lambda = 0.1, note = FALSE)
}

## Not run: 
##D par(mfcol = c(2,3))
##D tmp(1:3)
##D tmp(4:6)
##D tmp(7:9)
##D tmp(10:12)
##D tmp(13:17)
##D tmp(18:22)
##D par(mfcol = c(1,1))
## End(Not run)




