library(stemmatology)


### Name: PCC.reconstructModel
### Title: PCC.reconstructModel: Reconstruct the Model of Groups of
###   Witnesses
### Aliases: PCC.reconstructModel

### ** Examples

#A fictional simple tradition
x = list(database = matrix(
    c(
      1,0,1,1,1,1,1,1,
      1,0,1,2,2,2,1,2,
      1,0,0,3,2,1,NA,3,
      2,0,1,4,NA,1,1,1,
      2,1,2,5,2,1,1,4
    ), nrow = 8, ncol = 5,
    dimnames = list(c("VL1","VL2","VL3","VL4","VL5","VL6","VL7","VL8"),
                    c("A","B","C","D","E"))), 
    groups = list(c("A", "B", "C"), c("D", "E")))
#And now, reconstruct the groups
PCC.reconstructModel(x)



