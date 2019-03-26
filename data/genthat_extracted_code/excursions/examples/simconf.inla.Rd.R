library(excursions)


### Name: simconf.inla
### Title: Simultaneous confidence regions for latent Gaussian models
### Aliases: simconf.inla

### ** Examples

## No test: 
if (require.nowarnings("INLA")) {
n <- 10
x <- seq(0, 6, length.out=n)
y <- sin(x) + rnorm(n)
mu <- 1:n
result <- inla(y ~ 1 + f(mu, model='rw2'),
               data=list(y=y, mu=mu), verbose=FALSE,
               control.compute = list(config=TRUE),
               num.threads = 1)

res <- simconf.inla(result, name='mu', alpha = 0.05, max.threads = 1)

plot(result$summary.random$mu$mean,ylim=c(-2,2))
lines(res$a)
lines(res$b)
lines(res$a.marginal,col="2")
lines(res$b.marginal,col="2")
}
## End(No test)



