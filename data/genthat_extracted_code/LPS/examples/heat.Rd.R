library(LPS)


### Name: heat
### Title: Heatmap palette generation
### Aliases: heat heat.lin heat.exp

### ** Examples

  # Classical heatmap colors
  palette <- heat(c("green", "black", "red"))
  heat.scale(zlim=c(-2,2), col.heatmap=palette)
  
  # Two distinct shapes provided
  heat.scale(zlim=c(-2,2), col.heatmap=heat(shapeFun=heat.lin))
  heat.scale(zlim=c(-2,2), col.heatmap=heat(shapeFun=heat.exp))



