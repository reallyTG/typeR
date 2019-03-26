library(cocor)


### Name: cocor
### Title: Compare two correlations based on either dependent or
###   independent groups
### Aliases: cocor

### ** Examples

data("aptitude")

# Compare two correlations based on two independet groups
cocor(~logic + intelligence.a | logic + intelligence.a, aptitude)

# Compare two correlations based on two depenendent groups
# The correlations are overlapping
cocor(~knowledge + intelligence.a | logic + intelligence.a, aptitude$sample1)
cocor(~knowledge + intelligence.a | logic + intelligence.a, aptitude$sample2)
# The correlations are nonoverlapping
cocor(~logic + intelligence.b | knowledge + intelligence.a, aptitude$sample1)
cocor(~logic + intelligence.b | knowledge + intelligence.a, aptitude$sample2)

# Return result as a list of class 'htest'
cocor(~knowledge + intelligence.b | logic + intelligence.a, aptitude$sample1,
      return.htest=TRUE)




