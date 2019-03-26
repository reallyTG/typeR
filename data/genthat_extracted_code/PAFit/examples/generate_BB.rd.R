library(PAFit)


### Name: generate_BB
### Title: Simulating networks from the Bianconi-Barabasi model
### Aliases: generate_BB

### ** Examples

  library("PAFit")
  # generate a network from the BB model with alpha = 1, N = 100, m = 1
  # The inverse variance of the Gamma distribution of node fitnesses is s = 10
  net <- generate_BB(N = 100,m = 1,mode = 1, s = 10)
  str(net)
  plot(net)



