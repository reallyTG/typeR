library(pomp)


### Name: pomp constructor
### Title: Constructor of the basic pomp object
### Aliases: pomp pomp-class 'pomp constructor' 'accumulator variables'
###   'process model plug-ins' plug-ins onestep.sim euler.sim
###   discrete.time.sim onestep.dens gillespie.sim gillespie.hl.sim
###   Csnippet Csnippet-class coerce,Csnippet,character-method vectorfield
###   map
### Keywords: models interface programming ts

### ** Examples


## pomp encoding a stochastic Ricker model with a covariate:

pomp(data = data.frame(t = 1:100, y = NA),
     times = "t", t0 = 0,
     covar = data.frame(t=0:100,K=seq(from=50,to=200,length=101)),
     tcovar = "t",
     rprocess = discrete.time.sim(Csnippet("double e = rnorm(0,sigma);
                                            n = n*exp(r*(1-n/K)+e);"), delta.t = 1),
     skeleton = map(Csnippet("Dn = n*exp(r*(1-n/K));"), delta.t = 1),
     rmeasure = Csnippet("y = rnbinom_mu(theta,n);"),
     dmeasure = Csnippet("lik = dpois(y,n,give_log);"),
     rprior = Csnippet("r = rgamma(1,1); sigma = rgamma(1,1);"),
     dprior = Csnippet("lik = dgamma(r,1,1,1) + dgamma(sigma,1,1,1);
                        if (!give_log) lik = exp(lik);"),
     initializer = Csnippet("n = n_0;"),
     toEstimationScale = Csnippet("Tr = log(r); Tsigma = log(sigma);"),
     fromEstimationScale = Csnippet("Tr = exp(r); Tsigma = exp(sigma);"),
     paramnames = c("n_0", "r", "sigma","theta"),
     statenames = "n") -> rick

## fill it with simulated data:

rick <- simulate(rick, params = c(r=log(17), sigma = 0.1, theta=1, n_0 = 50))
plot(rick)

## Not run: 
##D     pompExample()
##D     demo(package="pomp")
## End(Not run)



