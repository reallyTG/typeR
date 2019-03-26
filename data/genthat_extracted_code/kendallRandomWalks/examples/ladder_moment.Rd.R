library(kendallRandomWalks)


### Name: ladder_moment
### Title: Estimate the distribution of first ladder moment for given level
### Aliases: ladder_moment

### ** Examples

{
kendall_rw <- simulate_kendall_rw(100, 100, runif, 0.5)
estim_ladder <- ladder_moment(kendall_rw, 1000)
estim_ladder
}




