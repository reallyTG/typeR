library(stemmatology)


### Name: PCC.buildGroup
### Title: PCC.buildGroup: Group Witnesses in Clusters
### Aliases: PCC.buildGroup
### Keywords: stemmatology

### ** Examples

# A fictional simple tradition
x = matrix(
    c(
      1,0,1,1,1,1,1,1,
      1,0,1,2,2,2,1,2,
      1,0,0,3,2,1,NA,3,
      2,0,1,4,NA,1,1,1,
      2,1,2,5,2,1,1,4
    ), nrow = 8, ncol = 5,
    dimnames = list(c("VL1","VL2","VL3","VL4","VL5","VL6","VL7","VL8"),
                    c("A","B","C","D","E")))
# Compute disagreement(s)
x = PCC.disagreement(x)
# And now build the groups
PCC.buildGroup(x)



