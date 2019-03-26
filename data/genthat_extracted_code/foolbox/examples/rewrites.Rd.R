library(foolbox)


### Name: rewrites
### Title: Object for setting up a transformation pipeline when defining
###   functions
### Aliases: rewrites
### Keywords: datasets

### ** Examples

# This is a very simple inline function that require we
# provide the function body as it should be inserted.
# For a more detailed version, see the Tutorial vignette.
# For a version that permits partial evaluation, see that vignette.
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




