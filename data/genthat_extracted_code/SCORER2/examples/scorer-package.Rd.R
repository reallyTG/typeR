library(SCORER2)


### Name: scorer2-package
### Title: Predict oligomerization state of coiled-coil sequences
### Aliases: scorer2-package

### ** Examples

# load pssm data
data(pssm)

# predict oligomerization of GCN4 wildtype
GCN4wt.score <- scorer2("GCN4wt", "MKQLEDKVEELLSKNYHLENEVARLKKLV", 
		"abcdefgabcdefgabcdefgabcdefga", pssm,  delta=1)



