library(excursions)


### Name: continuous
### Title: Calculate continuous domain excursion and credible contour sets
### Aliases: continuous

### ** Examples

## No test: 
if (require.nowarnings("INLA")) {
#Generate mesh and SPDE model
n.lattice = 10 #Increase for more interesting, but slower, examples
x=seq(from=0,to=10,length.out=n.lattice)
lattice=inla.mesh.lattice(x=x,y=x)
mesh=inla.mesh.create(lattice=lattice, extend=FALSE, refine=FALSE)
spde <- inla.spde2.matern(mesh, alpha=2)

#Generate an artificial sample
sigma2.e = 0.01
n.obs=100
obs.loc = cbind(runif(n.obs)*diff(range(x))+min(x),
runif(n.obs)*diff(range(x))+min(x))
Q = inla.spde2.precision(spde, theta=c(log(sqrt(0.5)), log(sqrt(1))))
x = inla.qsample(Q=Q)
A = inla.spde.make.A(mesh=mesh,loc=obs.loc)
Y = as.vector(A %*% x + rnorm(n.obs)*sqrt(sigma2.e))

## Calculate posterior
Q.post = (Q + (t(A)%*%A)/sigma2.e)
mu.post = as.vector(solve(Q.post,(t(A)%*%Y)/sigma2.e))
vars.post = excursions.variances(chol(Q.post))

## Calculate contour map with two levels
map = contourmap(n.levels = 2, mu = mu.post, Q = Q.post,
alpha=0.1, F.limit = 0.1,max.threads=1)

## Calculate the continuous representation
sets <- continuous(map, mesh, alpha=0.1)

## Plot the results
reo = mesh$idx$lattice
cols = contourmap.colors(map, col=heat.colors(100, 1),
credible.col = grey(0.5, 1))
names(cols) = as.character(-1:2)

par(mfrow = c(2,2))
image(matrix(mu.post[reo],n.lattice,n.lattice),
main="mean",axes=FALSE)
image(matrix(sqrt(vars.post[reo]),n.lattice,n.lattice),
main="sd", axes = FALSE)
image(matrix(map$M[reo],n.lattice,n.lattice),col=cols,axes=FALSE)
idx.M = setdiff(names(sets$M), "-1")
plot(sets$M[idx.M], col=cols[idx.M])
}
## End(No test)



