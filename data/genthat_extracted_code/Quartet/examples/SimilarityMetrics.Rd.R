library(Quartet)


### Name: SimilarityMetrics
### Title: Tree similarity metrics
### Aliases: SimilarityMetrics DoNotConflict ExplicitlyAgree
###   StrictJointAssertions SemiStrictJointAssertions SymmetricDifference
###   RobinsonFoulds MarczewskiSteinhaus SteelPenny QuartetDivergence

### ** Examples

  data('sq_trees')
  
  sq_status <- QuartetStatus(sq_trees)
  SimilarityMetrics(sq_status)
  QuartetDivergence(sq_status, similarity=FALSE)




