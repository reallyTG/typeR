library(maps)


### Name: match.map
### Title: Index map regions
### Aliases: match.map
### Keywords: dplot

### ** Examples

# filled map showing Republican vote in 1900
# (figure 6 in the reference)
data(state, package = "datasets")
data(votes.repub)
state.to.map <- match.map("state", state.name)
x <- votes.repub[state.to.map, "1900"]
gray.colors <- function(n) gray(rev(0:(n - 1))/n)
color <- gray.colors(100)[floor(x)]
map("state", fill = TRUE, col = color); map("state", add = TRUE)



