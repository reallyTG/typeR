library(robustrao)


### Name: ParallelBoundIndices
### Title: Parallel computation of the lower/upper bounds of the
###   uncertainty interval of the Rao-Stirling diversity index.
### Aliases: ParallelBoundIndices

### ** Examples

#Load data
data(pubdata1)

#Get upper bound indices of the uncertainty interval of the Rao-Stirling diversity index.
ParallelBoundIndices("upper", pd1.count.matrix, pd1.uncat.refs, pd1.similarity, TRUE, 0.233, 4, 2)

#Get lower bound indices of the uncertainty interval of the Rao-Stirling diversity index.
ParallelBoundIndices("lower", pd1.count.matrix, pd1.uncat.refs, pd1.similarity, TRUE, 0.233, 4, 2)

#When many references of a publication are uncategorized, a warning message is displayed
#to inform the user. Such cases require longer computation times.




