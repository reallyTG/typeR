library(DiagrammeR)


### Name: replace_in_spec
### Title: Razor-like template for diagram specification
### Aliases: replace_in_spec

### ** Examples

## Not run: 
##D # a simple example to use a LETTER as a node label
##D spec <- "
##D   digraph { '@1' }
##D 
##D  [1]: LETTERS[1]
##D "
##D grViz(replace_in_spec(spec))
##D 
##D 
##D spec <- "
##D digraph a_nice_graph {
##D node [fontname = Helvetica]
##D a [label = '@1']
##D b [label = '@2-1']
##D c [label = '@2-2']
##D d [label = '@2-3']
##D e [label = '@2-4']
##D f [label = '@2-5']
##D g [label = '@2-6']
##D h [label = '@2-7']
##D i [label = '@2-8']
##D j [label = '@2-9']
##D a -> { b c d e f g h i j}
##D }
##D 
##D [1]: 'top'
##D [2]: 10:20
##D "
##D grViz(replace_in_spec(spec))
## End(Not run)



