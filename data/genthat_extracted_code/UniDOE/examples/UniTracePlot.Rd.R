library(UniDOE)


### Name: UniTracePlot
### Title: Draw discrepancy value trace in optimization process.
### Aliases: UniTracePlot

### ** Examples

  ##e.g.
  n=12 #(must be multiples of q)
  s=3
  q=4
  Dlst = GenUD(n=n,s=s,q=q,crit="MD2",maxiter=100)
  UniTracePlot(output=Dlst)



