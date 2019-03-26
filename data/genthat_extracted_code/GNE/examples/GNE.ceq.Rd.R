library(GNE)


### Name: GNE.ceq
### Title: Constrained equation reformulation of the GNE problem.
### Aliases: GNE.ceq
### Keywords: nonlinear optimize

### ** Examples



#-------------------------------------------------------------------------------
# (1) Example 5 of von Facchinei et al. (2007)
#-------------------------------------------------------------------------------

dimx <- c(1, 1)
#Gr_x_j O_i(x)
grobj <- function(x, i, j)
{
	if(i == 1)
		res <- c(2*(x[1]-1), 0)
	if(i == 2)
		res <- c(0, 2*(x[2]-1/2))
	res[j]	
}
#Gr_x_k Gr_x_j O_i(x)
heobj <- function(x, i, j, k)
	2 * (i == j && j == k)

dimlam <- c(1, 1)
#constraint function g_i(x)
g <- function(x, i)
	sum(x[1:2]) - 1
#Gr_x_j g_i(x)
grg <- function(x, i, j)
	1
#Gr_x_k Gr_x_j g_i(x)
heg <- function(x, i, j, k)
	0


x0 <- rep(0, sum(dimx))
z0 <- c(x0, 2, 2, max(10, 5-g(x0, 1) ), max(10, 5-g(x0, 2) ) )

#true value is (3/4, 1/4, 1/2, 1/2)
GNE.ceq(z0, dimx, dimlam, grobj=grobj, heobj=heobj, 
	constr=g, grconstr=grg, heconstr=heg, method="PR", 
	control=list(trace=0, maxit=10))


GNE.ceq(z0, dimx, dimlam, grobj=grobj, heobj=heobj, 
	constr=g, grconstr=grg, heconstr=heg, method="AS", global="pwldog", 
	xscalm="auto", control=list(trace=0, maxit=100))


#-------------------------------------------------------------------------------
# (2) Duopoly game of Krawczyk and Stanislav Uryasev (2000)
#-------------------------------------------------------------------------------


#constants
myarg <- list(d= 20, lambda= 4, rho= 1)

dimx <- c(1, 1)
#Gr_x_j O_i(x)
grobj <- function(x, i, j, arg)
{
	res <- -arg$rho * x[i]
	if(i == j)
	res <- res + arg$d - arg$lambda - arg$rho*(x[1]+x[2])
	-res
}
#Gr_x_k Gr_x_j O_i(x)
heobj <- function(x, i, j, k, arg)
	arg$rho * (i == j) + arg$rho * (j == k)	


dimlam <- c(1, 1)
#constraint function g_i(x)
g <- function(x, i)
	-x[i]
#Gr_x_j g_i(x)
grg <- function(x, i, j)
	-1*(i == j)
#Gr_x_k Gr_x_j g_i(x)
heg <- function(x, i, j, k)
	0

#true value is (16/3, 16/3, 0, 0) 

x0 <- rep(0, sum(dimx))
z0 <- c(x0, 2, 2, max(10, 5-g(x0, 1) ), max(10, 5-g(x0, 2) ) )


GNE.ceq(z0, dimx, dimlam, grobj=grobj, heobj=heobj, arggrobj=myarg, 
	argheobj=myarg, constr=g, grconstr=grg, heconstr=heg,
	method="PR", control=list(trace=0, maxit=10))

GNE.ceq(z0, dimx, dimlam, grobj=grobj, heobj=heobj, arggrobj=myarg, 
	argheobj=myarg, constr=g, grconstr=grg, heconstr=heg, 
	method="AS", global="pwldog", xscalm="auto", control=list(trace=0, maxit=100))

	




