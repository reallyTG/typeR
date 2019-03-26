library(sideChannelAttack)


### Name: simulator.Simple1
### Title: simulator.Simple1
### Aliases: simulator.Simple1

### ** Examples

n=100
clee = c(round(runif(6)))
inp=matrix(round(runif(6*n)),ncol=6)

#creating a trace without noise through the simulator
traces=simulator.Simple1(inp,clee)



