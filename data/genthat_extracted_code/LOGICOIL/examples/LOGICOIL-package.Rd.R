library(LOGICOIL)


### Name: LOGICOIL-package
### Title: Predict oligomerization state of coiled-coil sequences.
### Aliases: LOGICOIL-package

### ** Examples

library(nnet)
data(pssm)
data(Model_Parameters)
data(LOGICOILfit)

score <- LOGICOIL("GCN4wt", "MKQLEDKVEELLSKNYHLENEVARLKKLV", 
    "abcdefgabcdefgabcdefgabcdefga", plot.result=TRUE)

# print output
print(score)



