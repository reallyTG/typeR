library(GERGM)


### Name: plot_network
### Title: Plots of value-edged networks.
### Aliases: plot_network

### ** Examples

set.seed(12345)
sociomatrix <- matrix(rnorm(400,0,20),20,20)
colnames(sociomatrix) <- rownames(sociomatrix) <- letters[1:20]
plot_network(sociomatrix)



