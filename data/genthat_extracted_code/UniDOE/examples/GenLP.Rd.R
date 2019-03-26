library(UniDOE)


### Name: GenLP
### Title: Generating uniform designs by level permutation
### Aliases: GenLP

### ** Examples


  n=27#(must be multiples of q)
  s=13
  q=3
  crit = "MD2" #(Mixture L2 criteria)
  res1 = GenUD(n,s,q,crit=crit,maxiter=100)
  res2 = GenLP(res1$final_design,vis=TRUE, maxiter=100) # To improve ...



