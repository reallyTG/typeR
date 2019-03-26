library(UniDOE)


### Name: DesignPairPlot
### Title: Draw pair plot for design of experiments
### Aliases: DesignPairPlot

### ** Examples

##e.g.1
n=12 #(must be multiples of q)
s=3
q=4
crit = "MD2"#(Mixture L2 criteria)
D = DesignQuery(n=n,s=s,q=q,crit="MD2")
DesignPairPlot(D)

##e.g.2
n=12 #(must be multiples of q)
s=3
q=3
crit = "MD2"#(Mixture L2 criteria)
D = DesignQuery(n=n,s=s,q=q,crit="MD2")
DesignPairPlot(D,Diag=TRUE)




