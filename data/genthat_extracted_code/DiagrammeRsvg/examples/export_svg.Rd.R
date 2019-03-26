library(DiagrammeRsvg)


### Name: export_svg
### Title: Export grViz graph as SVG with 'V8'
### Aliases: export_svg

### ** Examples

## Not run: 
##D  library(DiagrammeR)
##D  svg <- export_svg(grViz('digraph{a->b; c->a; c->b; c->d;}'))
##D 
##D  # this can then be used with htmltools and can save significantly
##D  # on size of output using svg rather than unrendered grViz
##D  library(htmltools)
##D  html_print(HTML(svg))
## End(Not run)



