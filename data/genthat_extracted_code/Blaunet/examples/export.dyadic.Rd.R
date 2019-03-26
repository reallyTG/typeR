library(Blaunet)


### Name: export.dyadic
### Title: Outputs dyadic level measures computed by the user
### Aliases: export.dyadic

### ** Examples

data(BSANet)
square.data <- BSANet$square.data
el <- BSANet$el
b <- blau(square.data, node.ids = 'person', ecology.ids = 'city', graph = el)
b <- dyadic(b, dev.range = rep(1.5, 3)) # 3 is the number of dimensions
export.dyadic(b)




