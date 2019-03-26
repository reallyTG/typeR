library(rggobi)


### Name: close.GGobiDisplay
### Title: Close display
### Aliases: close.GGobiDisplay
### Keywords: internal

### ** Examples

if (interactive()) {
g <- ggobi(mtcars)
displays(g)
close(displays(g)[[1]])
displays(g)}


