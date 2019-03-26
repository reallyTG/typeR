library(MBESS)


### Name: ss.power.pcm
### Title: Sample size planning for power for polynomial change models
### Aliases: ss.power.pcm
### Keywords: design

### ** Examples

# Example from Raudenbush and Liu (2001)
ss.power.pcm(beta=-.4, tau=.003, level.1.variance=.0262, frequency=2, duration=2, 
desired.power=.80, alpha.level=.05, standardized=TRUE, directional=FALSE)
ss.power.pcm(beta=-.4, tau=.003, level.1.variance=.0262, frequency=2, duration=2,
N=238, alpha.level=.05, standardized=TRUE, directional=FALSE)


# The standardized effect size is obtained as beta/sqrt(tau): -.4/sqrt(.003) = -.0219.
# ss.power.pcm(beta=-.0219, tau=.003, level.1.variance=.0262, frequency=2, duration=2, 
# desired.power=.80, alpha.level=.05, standardized=FALSE, directional=FALSE)
ss.power.pcm(beta=-.0219, tau=.003, level.1.variance=.0262, frequency=2, duration=2, 
N=238, alpha.level=.05, standardized=FALSE, directional=FALSE)




