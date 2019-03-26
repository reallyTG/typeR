library(IDetect)


### Name: sol_path_pcm
### Title: The solution path for the case of piecewise-constant signals
### Aliases: sol_path_pcm

### ** Examples

three.cpt <- c(rep(4,4000),rep(0,4000),rep(-4,4000),rep(1,4000))
three.cpt.noise <- three.cpt + rnorm(16000)
solution.path <- sol_path_pcm(three.cpt.noise)



