library(GNE)


### Name: GNE.nseq
### Title: Non smooth equation reformulation of the GNE problem.
### Aliases: GNE.nseq
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



#true value is (3/4, 1/4, 1/2, 1/2)

z0 <- rep(0, sum(dimx)+sum(dimlam))

funSSR(z0, dimx, dimlam, grobj=grobj, constr=g, grconstr=grg, compl=phiFB, echo=FALSE)

	
jacSSR(z0, dimx, dimlam, heobj=heobj, constr=g, grconstr=grg, 
	heconstr=heg, gcompla=GrAphiFB, gcomplb=GrBphiFB)


GNE.nseq(z0, dimx, dimlam, grobj=grobj, NULL, heobj=heobj, NULL, 
	constr=g, NULL, grconstr=grg, NULL, heconstr=heg, NULL, 
	compl=phiFB, gcompla=GrAphiFB, gcomplb=GrBphiFB, method="Newton", 
	control=list(trace=1))

GNE.nseq(z0, dimx, dimlam, grobj=grobj, NULL, heobj=heobj, NULL, 
	constr=g, NULL, grconstr=grg, NULL, heconstr=heg, NULL, 
	compl=phiFB, gcompla=GrAphiFB, gcomplb=GrBphiFB, method="Broyden", 
	control=list(trace=1))



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

z0 <- rep(0, sum(dimx)+sum(dimlam))

funSSR(z0, dimx, dimlam, grobj=grobj, myarg, constr=g, grconstr=grg, compl=phiFB, echo=FALSE)

jacSSR(z0, dimx, dimlam, heobj=heobj, myarg, constr=g, grconstr=grg, 
	heconstr=heg, gcompla=GrAphiFB, gcomplb=GrBphiFB)


GNE.nseq(z0, dimx, dimlam, grobj=grobj, myarg, heobj=heobj, myarg, 
	constr=g, NULL, grconstr=grg, NULL, heconstr=heg, NULL, 
	compl=phiFB, gcompla=GrAphiFB, gcomplb=GrBphiFB, method="Newton", 
	control=list(trace=1))

GNE.nseq(z0, dimx, dimlam, grobj=grobj, myarg, heobj=heobj, myarg, 
	constr=g, NULL, grconstr=grg, NULL, heconstr=heg, NULL, 
	compl=phiFB, gcompla=GrAphiFB, gcomplb=GrBphiFB, method="Broyden", 
	control=list(trace=1))


	




