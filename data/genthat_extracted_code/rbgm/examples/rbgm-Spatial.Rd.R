library(rbgm)


### Name: boxSpatial
### Title: Convert to Spatial
### Aliases: boxSpatial boundarySpatial faceSpatial

### ** Examples

fname <- bgmfiles::bgmfiles(pattern = "antarctica_28")
bgm <- bgmfile(fname)
spdf <- boxSpatial(bgm)
sldf <- faceSpatial(bgm)

plot(boxSpatial(bgm), col = grey(seq(0, 1, length = nrow(bgm$boxes))))
plot(faceSpatial(bgm), col = rainbow(nrow(bgm$faces)), lwd = 2,  add = TRUE)



