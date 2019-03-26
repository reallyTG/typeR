library(highlight)


### Name: highlight
### Title: syntax highlighting based on the R parser
### Aliases: highlight

### ** Examples

## Not run: 
##D 	tf <- tempfile()
##D 	dump( "jitter", file = tf )
##D 	highlight( file = tf, detective = simple_detective,
##D 		renderer = renderer_html( document = TRUE ) )
##D 	highlight( file = tf, detective = simple_detective,
##D 		renderer = renderer_latex( document = TRUE ) )
##D 
## End(Not run)



