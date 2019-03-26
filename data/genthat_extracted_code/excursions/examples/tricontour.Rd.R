library(excursions)


### Name: tricontour
### Title: Calculate contour curves on a triangulation
### Aliases: tricontour tricontour.inla.mesh tricontour.matrix
###   tricontour.list tricontourmap tricontourmap.inla.mesh
###   tricontourmap.matrix tricontourmap.list

### ** Examples

## No test: 
  if (require.nowarnings("INLA")) {
    ## Generate mesh and SPDE model
    n.lattice <- 20 #increase for more interesting, but slower, examples
    x <- seq(from = 0, to = 10, length.out = n.lattice)
    lattice <- inla.mesh.lattice(x = x, y = x)
    mesh <- inla.mesh.create(lattice = lattice, extend = FALSE, refine = FALSE)
    spde <- inla.spde2.matern(mesh, alpha = 2)
    
    ## Generate an artificial sample
    sigma2.e <- 0.01
    n.obs <-1000
    obs.loc <- cbind(runif(n.obs) * diff(range(x)) + min(x),
                     runif(n.obs) * diff(range(x)) + min(x))
    Q <- inla.spde2.precision(spde, theta = c(log(sqrt(0.5)), log(sqrt(1))))
    x <- inla.qsample(Q = Q)
    A <- inla.spde.make.A(mesh = mesh, loc = obs.loc)
    Y <- as.vector(A %*% x + rnorm(n.obs) * sqrt(sigma2.e))
    
    ## Calculate posterior
    Q.post <- (Q + (t(A)%*%A)/sigma2.e)
    mu.post <- as.vector(solve(Q.post,(t(A)%*%Y)/sigma2.e))
    
    ## Calculate continuous contours
    tric <- tricontour(mesh, z = mu.post,
                       levels = as.vector(quantile(x, c(0.25, 0.75))))
   
    ## Discrete domain contours
    map <- contourmap(n.levels = 2, mu = mu.post, Q = Q.post,
                      alpha=0.1, compute = list(F = FALSE), max.threads=1)

    ## Calculate continuous contour map
    setsc <- tricontourmap(mesh, z = mu.post,
                           levels = as.vector(quantile(x, c(0.25, 0.75))))

    ## Plot the results
    reo <- mesh$idx$lattice
    idx.setsc <- setdiff(names(setsc$map), "-1")
    cols2 <- contourmap.colors(map, col=heat.colors(100, 0.5),
                               credible.col = grey(0.5, 0))
    names(cols2) <- as.character(-1:2)

    par(mfrow = c(1,2))
    image(matrix(mu.post[reo], n.lattice, n.lattice),
                 main = "mean", axes = FALSE)
    plot(setsc$map[idx.setsc], col = cols2[idx.setsc])
    par(mfrow = c(1,1))
  }
## End(No test)



