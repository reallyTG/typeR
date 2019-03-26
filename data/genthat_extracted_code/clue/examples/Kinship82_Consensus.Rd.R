library(clue)


### Name: Kinship82_Consensus
### Title: Gordon-Vichi Kinship82 Consensus Partition Data
### Aliases: Kinship82_Consensus
### Keywords: datasets

### ** Examples

## Load the consensus partitions.
data("Kinship82_Consensus")
## Fuzziness using the Partition Coefficient.
cl_fuzziness(Kinship82_Consensus)
## (Corresponds to 1 - F in the source.)
## Dissimilarities:
cl_dissimilarity(Kinship82_Consensus)
cl_dissimilarity(Kinship82_Consensus, method = "comem")



