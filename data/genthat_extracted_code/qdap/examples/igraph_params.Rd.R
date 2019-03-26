library(qdap)


### Name: vertex_apply
### Title: Apply Parameter to List of Igraph Vertices/Edges
### Aliases: vertex_apply edge_apply

### ** Examples

## Not run: 
##D x <- with(DATA.SPLIT, polarity(state, person))
##D bg_black <- Animate(x, neutral="white")
##D print(bg_black)
##D 
##D bgb <- vertex_apply(bg_black, label.color="grey80", size=20, color="grey40")
##D bgb <- edge_apply(bgb, label.color="yellow")
##D print(bgb, bg="black", pause=.75)
## End(Not run)



