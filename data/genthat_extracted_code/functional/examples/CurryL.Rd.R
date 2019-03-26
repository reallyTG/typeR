library(functional)


### Name: CurryL
### Title: Lazy curry; thanks, Jamie!
###   <https://github.com/klutometis/R-functional/issues/1>
### Aliases: CurryL

### ** Examples

# day is not defined; thanks, Jamie Folson.
CurryL(function(...) match.call(),
       x=5,
       y=as.Date(day))(z=as.Date(day,"%Y"))



