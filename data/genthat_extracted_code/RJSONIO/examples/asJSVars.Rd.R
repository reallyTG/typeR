library(RJSONIO)


### Name: asJSVars
### Title: Serialize R objects as Javsscript/ActionScript variables
### Aliases: asJSVars
### Keywords: IO programming

### ** Examples

 cat(asJSVars( a =  1:10, myMatrix = matrix(1:15, 3, 5)))
 cat(asJSVars( a =  1:10, myMatrix = matrix(1:15, 3, 5), types = TRUE))
 cat(asJSVars( a =  1:10, myMatrix = matrix(1:15, 3, 5),
        qualifier = "protected", types = TRUE))



