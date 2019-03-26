library(JAGUAR)


### Name: jaguar_sim
### Title: Run null or power simulations
### Aliases: jaguar_sim
### Keywords: score test simulations GWAS eQTL

### ** Examples

## An example to perform some null simulations
## NOTE: 10 sims are obviously not enough. Please try between 1000-10000.

nsim=10; alpha=0.05;
test = do.call("rbind",rlply(nsim,.progress="none",jaguar_sim(nobs=100,k=4)));
null.sim = apply(test,2,function(x) sum(x<=alpha)/nsim);



