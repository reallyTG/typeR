library(rmonad)


### Name: extract_metadata
### Title: Extract docstring and meta data from an anonymous function
### Aliases: extract_metadata
### Keywords: internal

### ** Examples

## extract metadata from a block 
expr <- substitute(
  {
    "this is the docstring"
    list(foo="this is meta data")
    5 * 32
  }
)
extract_metadata(expr)

foo <- function(x,y){
  "docstring"
  list(meta="data")
  x + y
}
## extract metadata from a function name
extract_metadata(substitute(foo), skip_name=FALSE)

## extract from a partially applied function
extract_metadata(substitute(foo(y=2)))



