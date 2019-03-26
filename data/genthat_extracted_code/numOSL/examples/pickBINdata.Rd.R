library(numOSL)


### Name: pickBINdata
### Title: BIN data set selection
### Aliases: pickBINdata pickBINdata.default
### Keywords: BIN file data extraction

### ** Examples

   ### Example 1 (visualize decay curves for Position=2):
   data(BIN)
   obj_pickBIN <- pickBINdata(BIN, Position=2, view=FALSE,
                              LType="OSL", force.matrix=TRUE)
   matplot(obj_pickBIN$BINdata[[1]][,1], 
           obj_pickBIN$BINdata[[1]][,-1], 
           main="Decay curves",
           xlab="Stimulation time (s)",
           ylab="Photon counts",
           type="l", log="xy")

  ### Example 2 (visualize test-dose decay curves for Position=2):
  obj_pickBIN <- pickBINdata(BIN, Position=2, Run=c(5,11,17,23,29,34,40), 
                             view=FALSE, LType="OSL", force.matrix=TRUE)
  matplot(obj_pickBIN$BINdata[[1]][,1], 
          obj_pickBIN$BINdata[[1]][,-1], 
          main="Test-dose decay curves",
          xlab="Stimulation time (s)",
          ylab="Photon counts",
          type="l", log="xy")

  ### Example 3 (visualize regenerative-dose decay curves for Position=2):
  obj_pickBIN <- pickBINdata(BIN, Position=2, Run=c(8,14,20,26,31,37), 
                             view=FALSE, LType="OSL", force.matrix=TRUE)
  matplot(obj_pickBIN$BINdata[[1]][,1], 
          obj_pickBIN$BINdata[[1]][,-1], 
          main="Regenerative-dose decay curves",
          xlab="Stimulation time (s)",
          ylab="Photon counts",
          type="l", log="xy")




