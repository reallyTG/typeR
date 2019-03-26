library(rggobi)


### Name: close.GGobi
### Title: Close GGobi instance
### Aliases: close.GGobi
### Keywords: dynamic

### ** Examples

if (interactive()) {
g1 <- ggobi(mtcars)
g2 <- ggobi(mtcars)
close(g2)
close(ggobi_get())}


