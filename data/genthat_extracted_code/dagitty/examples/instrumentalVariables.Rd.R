library(dagitty)


### Name: instrumentalVariables
### Title: Find Instrumental Variables
### Aliases: instrumentalVariables

### ** Examples

# The classic IV model
instrumentalVariables( "dag{ i->x->y; x<->y }", "x", "y" )
# A conditional instrumental variable
instrumentalVariables( "dag{ i->x->y; x<->y ; y<-z->i }", "x", "y" )



