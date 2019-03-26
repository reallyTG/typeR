library(foolbox)


### Name: [.foolbox_rewrite_spec
### Title: Provide list of rewrite transformations.
### Aliases: [.foolbox_rewrite_spec

### ** Examples

# This is a very simple inline function that require we
# provide the function body as it should be inserted.
# For a more detailed version, see the Tutorial vignette.
inline <- function(f, fn, body) {
   body <- substitute(body)
   rewrite(f) %>%
     rewrite_with(
         rewrite_callbacks() %>%
           add_call_callback(fn, function(expr, ...) body)
     )
}

g <- function(x) x**2
h <- rewrites[inline(g,y**2)] < function(y) y + g(y)
h




