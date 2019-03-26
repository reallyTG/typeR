library(IDetect)


### Name: sol_path_cplm
### Title: The solution path for the case of continuous piecewise-linear
###   signals
### Aliases: sol_path_cplm

### ** Examples

three.cpt <- c(seq(0, 499, 1), seq(498.5, 249, -0.5), seq(250.5,999,1.5), seq(998,499,-1))
three.cpt.noise <- three.cpt + rnorm(2000)
solution.path <- sol_path_cplm(three.cpt.noise)



