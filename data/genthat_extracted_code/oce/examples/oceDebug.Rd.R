library(oce)


### Name: oceDebug
### Title: Print a debugging message
### Aliases: oceDebug oce.debug

### ** Examples


foo <- function(debug)
{
   oceDebug(debug, "in function foo\n")
}
debug <- 1
oceDebug(debug, "in main")
foo(debug=debug-1)



