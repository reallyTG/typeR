library(Biograph)


### Name: StateSpace
### Title: Get state space
### Aliases: StateSpace

### ** Examples

data(GLHS)
z<- StateSpace (GLHS)
data (NLOG98)
z<- StateSpace (NLOG98,c("H","A","C","M","K"))
z <- StateSpace (NLOG98$path)



