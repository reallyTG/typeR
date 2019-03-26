library(maptools)


### Name: state.vbm
### Title: US State Visibility Based Map
### Aliases: state.vbm
### Keywords: datasets

### ** Examples

  data(state.vbm)
  plot(state.vbm)

  tmp <- state.x77[,'HS Grad']
  tmp2 <- cut(tmp, seq(min(tmp),max(tmp), length.out=11),
    include.lowest=TRUE)
  plot(state.vbm,col=cm.colors(10)[tmp2])



