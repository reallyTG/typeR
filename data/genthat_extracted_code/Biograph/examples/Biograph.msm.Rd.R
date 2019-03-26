library(Biograph)


### Name: Biograph.msm
### Title: Biograph to msm format
### Aliases: Biograph.msm

### ** Examples

 data(GLHS)
 D <- Biograph.msm (GLHS)
 # Function statetable.msm of msm package
 require(msm)
 statetable.msm(state,ID,data=D)



