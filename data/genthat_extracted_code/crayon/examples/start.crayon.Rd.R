library(crayon)


### Name: start.crayon
### Title: Switch on or off a style
### Aliases: start.crayon finish finish.crayon

### ** Examples

## The input is red (if color is supported)
get_name <- function() {
  cat("Enter your name:", start(red))
  input <- readline()
  cat(finish(red))
  input
}
name <- get_name()
name



