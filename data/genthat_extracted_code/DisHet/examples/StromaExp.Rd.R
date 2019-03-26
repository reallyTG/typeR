library(DisHet)


### Name: StromaExp
### Title: Stroma (Immune) Component Gene Expression Estimation
### Aliases: StromaExp

### ** Examples

  load(system.file("example/example_data.RData",package="DisHet"))
  exp_T <- exp_T[1:200,]
  exp_N <- exp_N[1:200,]
  exp_G <- exp_G[1:200,]
  
  rho <- DisHet(exp_T, exp_N, exp_G, save=FALSE, n_cycle=200, mean_last=50)
  S <- StromaExp(exp_T,exp_N,exp_G, rho)



