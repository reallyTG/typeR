library(Quartet)


### Name: ResolvedQuartets
### Title: Count resolved quartets
### Aliases: ResolvedQuartets ResolvedTriplets

### ** Examples

{
  data(sq_trees)
  
  ResolvedTriplets(sq_trees$collapse_some)
  # Equivalent to:
  ResolvedQuartets(sq_trees$collapse_some, countTriplets=TRUE)
  
  vapply(sq_trees, ResolvedQuartets, integer(2))
}




