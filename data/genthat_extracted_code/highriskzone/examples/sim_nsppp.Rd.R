library(highriskzone)


### Name: sim_nsppp
### Title: Generation of a realisation of a Neyman-Scott process
### Aliases: sim_nsppp

### ** Examples

## Not run: 
##D       
##D  data(craterA)
##D  data(craterB)
##D  set.seed(100)
##D  sim_pp1 <- sim_nsppp(craterA, radius=300, clustering=15, thinning=0.1)
##D  sim_pp2 <- sim_nsppp(craterB, radius=300, clustering=15, thinning=0.1)
##D  op <- par(mfrow = c(1, 2))
##D  plot(sim_pp1, main = "simulated cluster process 1")
##D  plot(sim_pp2, main = "simulated cluster process 2")
##D  par(op)
##D  
## End(Not run)



