library(catchr)


### Name: args_and_kwargs
### Title: Separate dots into Python-esque '*args' and '**kwargs'
### Aliases: args_and_kwargs

### ** Examples


x <- args_and_kwargs(unnamed_1, named_1="ba", "unnamed_2", named_2 = letters)
print(x$args)
print(x$kwargs)

## Not run: 
##D # Or see the `share_scales` from the `zplyr` package
##D share_scales <- function(...) {
##D   akw <- args_and_kwargs(...)
##D   # Unnamed arguments are ggplot scales
##D   geom_func_list <- purrr::map(akw$args, rlang::eval_tidy)
##D   # Named arguments are to be passed into those scales
##D   geoms <- purrr::map(geom_func_list, ~.(!!!akw$kwargs))
##D   return(geoms)
##D }
## End(Not run)



