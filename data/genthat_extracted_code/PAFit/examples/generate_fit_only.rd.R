library(PAFit)


### Name: generate_fit_only
### Title: Simulating networks from the Caldarelli model
### Aliases: generate_fit_only

### ** Examples

  library("PAFit")
  # generate a network from the Caldarelli model with alpha = 1, N = 100, m = 1
  # the inverse variance of distribution of node fitnesses is s = 10
  net <- generate_fit_only(N = 100,m = 1,mode = 1, s = 10)
  str(net)
  plot(net)



