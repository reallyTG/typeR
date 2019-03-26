library(Biograph)


### Name: state_age
### Title: Determines for given individuals state occupied at given ages
### Aliases: state_age

### ** Examples

  data(GLHS)
  param <- Parameters(GLHS)
  agetrans <- AgeTrans(Bdata=GLHS)
  z <- state_age (Bdata=GLHS,age=c(20,30),ID=c(15,208))
  


