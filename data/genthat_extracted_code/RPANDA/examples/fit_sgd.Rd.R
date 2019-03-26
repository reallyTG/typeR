library(RPANDA)


### Name: fit_sgd
### Title: Maximum likelihood fit of the SGD model
### Aliases: fit_sgd

### ** Examples

# Some examples may take a little bit of time. Be patient!
data(Calomys)
tot_time <- max(node.age(Calomys)$ages)
par_init <- c(1e7, 1e7-0.5, 1)
#fit_sgd(Calomys, tot_time, par_init, f=11/13)



