library(rggobi)


### Name: "variables<-.GGobiDisplay"
### Title: Set display variables
### Aliases: variables<-.GGobiDisplay
### Keywords: dynamic

### ** Examples

if (interactive()) {
g <- ggobi(mtcars)
d <- display(g[1], "Parallel Coordinates Display")
variables(d)
variables(d) <- list(X=1:8)
variables(d) <- list(X=c("mpg", "cyl"))
variables(d)}


