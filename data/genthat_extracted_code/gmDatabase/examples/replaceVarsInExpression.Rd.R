library(gmDatabase)


### Name: replaceVarsInExpression
### Title: Replace Variables in Expressions
### Aliases: replaceVarsInExpression
### Keywords: utilities

### ** Examples

a <- quote( A==B^C+A^2+C )
replaceVarsInExpression(a,list(A=quote(2*r^2),C=as.name("R"),B=pi))
a <- quote( A+B+C )
replaceVarsInExpression(a,list(A=quote(C^2),B=quote(A^2),C=quote(B^2)))



