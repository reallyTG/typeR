library(tfse)


### Name: add_arg_if
### Title: Add defaults to argument list
### Aliases: add_arg_if

### ** Examples

## arg list
args <- list(x = 5, y = TRUE, z = FALSE)

## add arg defaults
add_arg_if(args, w = TRUE, z = TRUE)

## add arg defaults, overriding any previous values
add_arg_if(args, x = 10, z = TRUE, override = TRUE)




