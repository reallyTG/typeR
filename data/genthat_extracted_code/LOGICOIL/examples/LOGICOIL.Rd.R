library(LOGICOIL)


### Name: LOGICOIL
### Title: Predict oligomerization state of coiled-coil sequences.
### Aliases: LOGICOIL

### ** Examples

library(nnet)
data(pssm)
data(Model_Parameters)
data(LOGICOILfit)

score <- LOGICOIL("GCN4wt", "MKQLEDKVEELLSKNYHLENEVARLKKLV", 
  	"abcdefgabcdefgabcdefgabcdefga", plot.result=FALSE)

# print output
print(score)



