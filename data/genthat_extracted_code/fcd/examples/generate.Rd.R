library(fcd)


### Name: generate
### Title: generate adjacency matrix of stochastic blockmodel,
###   degree-corrected block model or cockroach graph model.
### Aliases: gen.sbm gen.dcbm gen.cr

### ** Examples

A1 = gen.sbm(n = 10, theta.in = 0.3, theta.bw = 0.1, K = 2, seed = 2)
A2 = gen.dcbm(n = 10, theta.in = 0.3, theta.bw = 0.1, 
theta = seq(from = 0.1, to = 0.5, length.out = 20), K = 2, seed = 2)
A3 = gen.cr(n1 = 10)




