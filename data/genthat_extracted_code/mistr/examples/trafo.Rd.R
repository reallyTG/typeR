library(mistr)


### Name: trafo
### Title: Modifications of Transformations
### Aliases: trafo

### ** Examples

#init
P <- poisdist(5) ; x <- 5
P2 <- trafo(P, type = "init", trans = bquote(X + .(x)),
            invtrans = bquote(X - .(x)), print = bquote(X + .(x)),
            deriv = quote(1), operation = "+", value = x)
P2

#new
x = 3
P3 <- trafo(P2, type = "new", trans = bquote(.(x) * X),
            invtrans = bquote(X/.(x)), print = bquote(.(x) * X),
            deriv = bquote(1/.(x)), operation = "*", value = x)
P3

#update
x = 7 
P4 <- trafo(P3, type = "update", trans = bquote(.(x) * X),
            invtrans = bquote(X/.(x)), print = bquote(.(x) * X),
            deriv = bquote(1/.(x)), value = x)
P4

#go_back
P5 <- trafo(P4, type = "go_back")
P5



