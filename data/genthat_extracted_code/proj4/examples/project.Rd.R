library(proj4)


### Name: project
### Title: Projection of coordinates
### Aliases: project
### Keywords: spatial

### ** Examples

## this is just very simple, because we don't want to depend on
## maps package, so we can't show more useful stuff..
data(state)
s <- project(state.center, "+proj=merc")
plot(s, type='n', asp=1)
text(s,, state.abb)



