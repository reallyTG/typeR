library(Infusion)


### Name: add_simulation
### Title: Create or augment a list of simulated distributions of summary
###   statistics
### Aliases: add_simulation add_reftable

### ** Examples

# example of building a list of simulations from scratch:
myrnorm <- function(mu,s2,sample.size) {
  s <- rnorm(n=sample.size,mean=mu,sd=sqrt(s2))
  return(c(mean=mean(s),var=var(s)))
}
set.seed(123)
onedistrib <- t(replicate(100,myrnorm(1,1,10))) # toy example of simulated distribution
attr(onedistrib,"par") <- c(mu=1,sigma=1,sample.size=10) ## important!
simuls <- add_simulation(NULL, Simulate="myrnorm",
                         newsimuls=list("example"=onedistrib))
                     
## Example where a single Simulate returns all nRealizations:
myrnorm_tab <- function(mu,s2,sample.size, nsim) {
  replicate(nsim, 
            myrnorm(mu=mu,s2=s2,sample.size=sample.size)) ## n_summ_stats * nReal 
}
op <- Infusion.options(nRealizations=c(as_one=500)) 
parsp <- init_grid(lower=c(mu=2.8,s2=0.2,sample.size=40),
                   upper=c(mu=5.2,s2=3,sample.size=40))
simuls <- add_simulation(NULL,Simulate="myrnorm_tab",
                         nsim=Infusion.getOption('nRealizations'),
                         par.grid=parsp)
Infusion.options(op)

## Not run: 
##D # parallel version of the same:
##D op <- Infusion.options(nb_cores=2, nRealizations=c(as_one=500))
##D myrnorm_tab <- function(mu,s2,sample.size) {
##D   ## By default, Infusion.getOption('nRealizations') will fail on child process!
##D   replicate(1000,   
##D             myrnorm(mu=mu,s2=s2,sample.size=sample.size)) 
##D }
##D simuls <- add_simulation(NULL,Simulate="myrnorm_tab",par.grid=parsp,
##D                          # need to export function called by Simulate:
##D                          env=list2env(list(myrnorm=myrnorm)))
##D Infusion.options(op)
## End(Not run)

## see main documentation page for the package for other typical usage



