library(DesignLibrary)


### Name: match.call.defaults
### Title: Argument matching with defaults
### Aliases: match.call.defaults

### ** Examples


foo <- function(x=NULL,y=NULL,z=4, dots=TRUE, ...) {
  match.call.defaults(expand.dots=dots)
}





