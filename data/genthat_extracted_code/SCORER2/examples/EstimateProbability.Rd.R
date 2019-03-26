library(SCORER2)


### Name: EstimateProbability
### Title: Estimate oligomeric state score of coiled-coil sequences
### Aliases: EstimateProbability

### ** Examples

# load pssm data
data(pssm)

# define allowed amino and register characters
var <- list(
      amino = c("A","C","D","E","F","G","H","I","K","L",
      "M","N","P","Q","R","S","T","V","W","Y","X"),
      register = letters[1:7])
      
# run SCORER 2.0 on GCN4 wild-type
GCN4wt.score <- EstimateProbability("GCN4wt", 
			"MKQLEDKVEELLSKNYHLENEVARLKKLV", 
			"abcdefgabcdefgabcdefgabcdefga", 
			pssm, 
			var, 
			delta=1)



