library(bibliometrix)


### Name: duplicatedMatching
### Title: Searching of duplicated records in a bibliographic database
### Aliases: duplicatedMatching

### ** Examples

 
data(scientometrics)

M=rbind(scientometrics[1:20,],scientometrics[10:30,])

newM <- duplicatedMatching(M, Field = "TI", tol = 0.95)

dim(newM)





