library(SAPP)


### Name: linsim
### Title: Simulation of a Self-Exciting Point Process
### Aliases: linsim
### Keywords: spatial

### ** Examples

data(PProcess)   ## The point process data
linsim(PProcess, 20000, 0.13, 0.026,
       c(0.035,-0.0048), c(0.0,0.00017), c(0.007,-0.00000029), 0.007)



