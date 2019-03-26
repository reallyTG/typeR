library(rggobi)


### Name: imode
### Title: Interaction mode
### Aliases: imode imode<-
### Keywords: dynamic

### ** Examples

if (interactive()) {
g <- ggobi(mtcars)
d <- displays(g)[[1]]
imode(d)
imodes(d)
imode(d) <- "Brush"}


