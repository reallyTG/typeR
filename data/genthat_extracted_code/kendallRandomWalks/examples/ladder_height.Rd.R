library(kendallRandomWalks)


### Name: ladder_height
### Title: Estimate the distribution of first ladder height for given level
### Aliases: ladder_height

### ** Examples

{
  kendall_rw <- simulate_kendall_rw(100, 100, runif, 0.5)
  estim_ladder <- ladder_height(kendall_rw, 1000)
  estim_ladder
}




