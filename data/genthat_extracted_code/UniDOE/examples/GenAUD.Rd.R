library(UniDOE)


### Name: GenAUD
### Title: Generating Augmented Uniform Design of Experiments
### Aliases: GenAUD

### ** Examples

#Example 1.
#Set a fixed initial matrix:
n=12 #(must be multiples of q)
mat0 = matrix(c(1,1,1,2,2,2,3,3,3),ncol=3,byrow=TRUE)# nb. of columns=s
crit = "MD2" #(Mixture L2 criteria)
res = GenAUD(X0=mat0,n,crit=crit,maxiter=100)

# Example 2.
# Set a fixed initial matrix with visualization:
n=9 #(must be multiples of q)
mat0 = matrix(c(1,1,1,2,2,2,3,3,3), ncol = 3, byrow = TRUE)
crit = "MD2" #(Mixture L2 criteria)
list1=GenAUD(X0=mat0,n,crit=crit,vis=TRUE,maxiter=100)



