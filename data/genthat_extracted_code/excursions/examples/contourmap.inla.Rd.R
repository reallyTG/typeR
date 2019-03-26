library(excursions)


### Name: contourmap.inla
### Title: Contour maps and contour map quality measures for latent
###   Gaussian models
### Aliases: contourmap.inla

### ** Examples

## No test: 
if (require.nowarnings("INLA")) {
#Generate mesh and SPDE model
n.lattice = 10 #increase for more interesting, but slower, examples
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
Y = as.vector(A %*% x + rnorm(n.obs) * sqrt(sigma2.e))

## Estimate the parameters using INLA
mesh.index = inla.spde.make.index(name="field",n.spde=spde$n.spde)
ef = list(c(mesh.index,list(Intercept=1)))

s.obs = inla.stack(data=list(y=Y), A=list(A), effects=ef, tag="obs")
s.pre = inla.stack(data=list(y=NA), A=list(1), effects=ef,tag="pred")
stack = inla.stack(s.obs,s.pre)
formula = y ~ -1 + Intercept + f(field, model=spde)
result = inla(formula=formula, family="normal", data = inla.stack.data(stack),
             control.predictor=list(A=inla.stack.A(stack),compute=TRUE),
             control.compute = list(config = TRUE),
             num.threads = 1)

## Calculate contour map with two levels
map = contourmap.inla(result, stack = stack, tag = 'pred',
                     n.levels = 2, alpha=0.1, F.limit = 0.1,
                     max.threads = 1)

## Plot the results
cols = contourmap.colors(map, col=heat.colors(100, 1),
                        credible.col = grey(0.5, 1))
image(matrix(map$M[mesh$idx$lattice], n.lattice, n.lattice), col = cols)
}
## End(No test)



