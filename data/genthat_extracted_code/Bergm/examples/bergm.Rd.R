library(Bergm)


### Name: bergm
### Title: Parameter estimation for Bayesian ERGMs
### Aliases: bergm

### ** Examples

# Load the florentine marriage network
data(florentine)

# Posterior parameter estimation:

p.flo <- bergm(flomarriage ~ edges + kstar(2),
               burn.in = 50,
               aux.iters = 500,
               main.iters = 500,
               gamma = 1)

# Posterior summaries:

bergm.output(p.flo)

# Bayesian goodness-of-fit test:

bgof(p.flo,
     aux.iters = 500,
     sample.size = 50,
     n.deg = 10,
     n.dist = 9,
     n.esp = 6)




