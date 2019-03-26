library(Biograph)


### Name: Biograph.mvna
### Title: Converts Biograph object to input data for mvna package
### Aliases: Biograph.mvna

### ** Examples

  data(GLHS)
  D <- Biograph.mvna (GLHS)
  # Run mvna:
  require (mvna)
  zz <- attr(D$D,"param")$namstates
  zzz <- attr(D$D,"param")$trans_possible
  na <- mvna(data=D$D,state.names=zz,tra=zzz,cens.name=D$cens)
  



