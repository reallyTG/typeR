library(UniDOE)


### Name: GenUD
### Title: Generating Uniform Design of Experiments
### Aliases: GenUD

### ** Examples

##e.g.1
n=12 #(must be multiples of q)
s=3
q=4
crit = "MD2"#(Mixture L2 criteria)
res = GenUD(n,s,q,crit=crit,maxiter=100)

##e.g.2
n=10 #(must be multiples of q)
s=3
q=5
init = "rand"
crit = "MD2" #(Mixture L2 criteria)
vis=TRUE
res=GenUD(n,s,q,init=init,crit=crit,maxiter=100,vis=vis)

##e.g.3
#If init = "orth",
#algorithm will fix columns of initX and expand total number of columns to s for final design.
s=5
init = "orth"
# initX should be orthogonal design with nrow=n&level=q
initX = matrix(c(1,1,2,2,3,3,3,3,1,1,2,2), ncol=2)
res = GenUD(s=s,init=init,initX = initX,maxiter=100)

##e.g.4
#If init="input", algorithm will search for better a better design with same size as initX.
init = "input"
# initX should be orthogonal design with nrow=n&level=q
initX = matrix(c(1,1,2,2,3,3,3,3,1,1,2,2),ncol=2)
res = GenUD(init=init,initX = initX,maxiter=100)




