library(sinew)


### Name: pretty_namespace
### Title: Append namespace to functions in script
### Aliases: pretty_namespace

### ** Examples

txt <- '#some comment
yy <- function(a=4){
  head(runif(10),a)
  # a comment
}

zz <- function(v=10,a=8){
  head(runif(v),a)
}'

pretty_namespace(text=txt)




