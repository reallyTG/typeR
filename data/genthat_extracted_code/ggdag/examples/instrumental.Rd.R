library(ggdag)


### Name: Instrumental Variables
### Title: Find Instrumental Variables
### Aliases: 'Instrumental Variables' node_instrumental ggdag_instrumental

### ** Examples

library(dagitty)

node_instrumental(dagitty("dag{ i->x->y; x<->y }"), "x", "y")
ggdag_instrumental(dagitty("dag{ i->x->y; i2->x->y; x<->y }"), "x", "y")




