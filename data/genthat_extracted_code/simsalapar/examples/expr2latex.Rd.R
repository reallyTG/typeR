library(simsalapar)


### Name: expr2latex
### Title: Translate 'plotmath' expressions to LaTeX
### Aliases: expr2latex escapeLatex
### Keywords: utilities

### ** Examples

expr2latex( quote( N[sim] ) )
expr2latex( quote( N[sim] ~ O(n) ) )
expr2latex( quote(x %notin% N) )
expr2latex( quote(x %+-% epsilon) )
expr2latex( quote(N[s*m^2]) )
expr2latex( quote( 2^{N[sim] - 3} ~~~ O(n^{n^2}) ) )

escapeLatex(c("#{positives}", "A | B"))



