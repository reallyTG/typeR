library(TreeSearch)


### Name: IWScoreMorphy
### Title: Profile Parsimony Score
### Aliases: IWScoreMorphy ProfileScore ProfileScoreMorphy
###   ProfileInitMorphy ProfileDestroyMorphy
### Keywords: tree

### ** Examples

  data(referenceTree)
  data(congreveLamsdellMatrices)
  # In actual use, the dataset should be prepared with a much higher
  # precision: try 1e+06?
  # Of course, gaining higher precision takes substantially longer.
  dataset <- PrepareDataProfile(congreveLamsdellMatrices[[42]], precision=1e+03)
  ProfileScore(referenceTree, dataset)




