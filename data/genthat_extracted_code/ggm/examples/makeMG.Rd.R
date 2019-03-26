library(ggm)


### Name: makeMG
### Title: Mixed Graphs
### Aliases: makeMG
### Keywords: graphs ancestral graph mixed graph models multivariate

### ** Examples

## Examples from Richardson and Spirtes (2002)
a1 <- makeMG(dg=DAG(a~b, b~d, d~c), bg=UG(~a*c))  
isAG(a1)    # Not an AG. (a2) p.969    
a2 <- makeMG(dg=DAG(b ~ a, d~c), bg=UG(~a*c+c*b+b*d))           # Fig. 3 (b1) p.969  
isAG(a1)
a3 <- makeMG(ug = UG(~ a*c), dg=DAG(b ~ a, d~c), bg=UG(~ b*d)) # Fig. 3 (b2) p.969
a5 <- makeMG(bg=UG(~alpha*beta+gamma*delta), dg=DAG(alpha~gamma,
delta~beta))  # Fig. 6 p. 973
## Another Example
a4 <- makeMG(ug=UG(~y0*y1), dg=DAG(y4~y2, y2~y1), bg=UG(~y2*y3+y3*y4))  
## A mixed graphs with double edges. 
mg <- makeMG(dg = DG(Y ~ X, Z~W, W~Z, Q~X), ug = UG(~X*Q), 
bg = UG(~ Y*X+X*Q+Q*W + Y*Z) )
## Chronic pain data: a regression graph
chronic.pain <- makeMG(dg = DAG(Y ~ Za, Za ~ Zb + A, Xa ~ Xb, 
Xb ~ U+V, U ~ A + V, Zb ~ B, A ~ B), bg = UG(~Za*Xa + Zb*Xb))



