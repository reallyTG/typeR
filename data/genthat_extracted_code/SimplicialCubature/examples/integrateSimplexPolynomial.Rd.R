library(SimplicialCubature)


### Name: integrateSimplexPolynomial
### Title: Exact integration of a polynomial over a simplex
### Aliases: integrateSimplexPolynomial

### ** Examples

S <- CanonicalSimplex( 4 ) # 4-dim. simplex
p1 <- definePoly( 1.0, matrix( c(2,0,0,5), nrow=1) )
printPoly(p1)
# same as example for function grnmol( ), but explicitly using the fact that the integrand 
# function is a polynomial, and automatic selection of the order of the integration rule
integrateSimplexPolynomial( p1, S, method="GM" ) 
## No test: 
integrateSimplexPolynomial( p1, S, method="LA" )
## End(No test)


p2 <- definePoly( c(5,-6), matrix( c(3,1,0,0,   0,0,0,7), nrow=2, byrow=TRUE)  )
printPoly( p2 )
integrateSimplexPolynomial( p2, S, method="GM" )  # correct answer  -1.352814e-05
integrateSimplexPolynomial( p2, S, method="LA" )  # correct answer  -1.352814e-05

# integrate random polynomials and random simplices in different dimensions
for (n in 3:5) {
  S <- matrix( rnorm(n*(n+1)), nrow=n, ncol=n+1 ) 
  p.rand <- definePoly( rnorm(1), matrix( c(4, rep(0,n-1)),  nrow=1 ) )
  #printPoly(p.rand)
  tmp1 <- integrateSimplexPolynomial( p.rand, S, method="GM" )
  tmp2 <- integrateSimplexPolynomial( p.rand, S, method="LA" )  
  cat("n=",n,"  GM integral=",tmp1$integral,"   functionEvaluations=",tmp1$functionEvaluations, 
     "  LA integral=", tmp2$integral, "   functionEvaluations=",tmp2$functionEvaluations,"\n")
}





