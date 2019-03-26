library(clue)


### Name: GVME_Consensus
### Title: Gordon-Vichi Macroeconomic Consensus Partition Data
### Aliases: GVME_Consensus
### Keywords: datasets

### ** Examples

## Load the consensus partitions.
data("GVME_Consensus")
## Pick the partitions into 2 classes.
GVME_Consensus_2 <- GVME_Consensus[1 : 4]
## Fuzziness using the Partition Coefficient.
cl_fuzziness(GVME_Consensus_2)
## (Corresponds to 1 - F in the source.)
## Dissimilarities:
cl_dissimilarity(GVME_Consensus_2)
cl_dissimilarity(GVME_Consensus_2, method = "comem")



