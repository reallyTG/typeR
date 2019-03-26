library(polymapR)


### Name: calcSegtypeInfo
### Title: Build a list of segregation types
### Aliases: calcSegtypeInfo

### ** Examples

si4 <- calcSegtypeInfo(ploidy=4) # two 4x parents: a 4x F1 progeny
print(si4[["11_0"]])

si3 <- calcSegtypeInfo(ploidy=4, ploidy2=2) # a 4x and a diplo parent: a 3x progeny
print(si3[["11_0"]])



