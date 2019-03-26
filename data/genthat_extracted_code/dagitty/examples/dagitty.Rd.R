library(dagitty)


### Name: dagitty
### Title: Parse DAGitty Graph
### Aliases: dagitty

### ** Examples

# Specify a simple DAG containing one path
g <- dagitty("dag{ 
  a -> b ;
  b -> c ;
  d -> c
 }")
# Newlines and semicolons are optional
g <- dagitty("dag{ 
  a -> b b -> c c -> d
 }")
# Paths can be specified in one go; the semicolon below is
# optional
g <- dagitty("dag{ 
  a -> b ->c ; c -> d
 }")
# Edges can be written in reverse notation
g <- dagitty("dag{ 
  a -> b -> c <- d
 }")
# Spaces are optional as well
g <- dagitty("dag{a->b->c<-d}")
# Variable attributes can be set in square brackets
# Example: DAG with one exposure, one outcome, and one unobserved variable
g <- dagitty("dag{
  x -> y ; x <- z -> y
  x [exposure]
  y [outcome]
  z [unobserved]
}") 
# The same graph as above
g <- dagitty("dag{x[e]y[o]z[u]x<-z->y<-x}")
# A two-factor latent variable model
g <- dagitty("dag {
  X <-> Y
  X -> a X -> b X -> c X -> d
  Y -> a Y -> b Y -> c Y -> d
}")
# Curly braces can be used to "group" variables and 
# specify edges to whole groups of variables
# The same two-factor model
g <- dagitty("dag{ {X<->Y} -> {a b c d} }")
# A MAG
g <- dagitty("mag{ a -- x -> y <-> z }")
# A PDAG
g <- dagitty("pdag{ x -- y -- z }")
# A PAG
g <- dagitty("pag{ x @-@ y @-@ z }")  



