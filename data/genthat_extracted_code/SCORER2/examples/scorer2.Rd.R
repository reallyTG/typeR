library(SCORER2)


### Name: scorer2
### Title: Predict oligomerization state of coiled-coil sequences
### Aliases: scorer2

### ** Examples

# load pssm data
data(pssm)

# predict oligomerization of GCN4 wildtype
GCN4wt.score <- scorer2("GCN4wt", "MKQLEDKVEELLSKNYHLENEVARLKKLV", 
		"abcdefgabcdefgabcdefgabcdefga", pssm,  delta=1)



