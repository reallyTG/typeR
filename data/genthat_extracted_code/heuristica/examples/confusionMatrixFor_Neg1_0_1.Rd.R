library(heuristica)


### Name: confusionMatrixFor_Neg1_0_1
### Title: Confusion matrix for categories -1, 0, 1 (the output of
###   predictPair).
### Aliases: confusionMatrixFor_Neg1_0_1

### ** Examples

# Example 1
# Below, the correct outcome is always 1, so only the last row of the
# confusion matrix has non-zero counts.  But the predictor makes a few
# mistakes, so some non-zero counts are off the diagonal.
confusionMatrixFor_Neg1_0_1(c(1,1,1), c(1,-1,-1))
# outputs:
#    -1 0 1
# -1  0 0 0
# 0   0 0 0
# 1   2 0 1
#
# Example 2
# The prediction always matches the reference outcome, so all non-zero
# counts are on the diagonal.
confusionMatrixFor_Neg1_0_1(c(1,1,0,0,-1,-1), c(1,1,0,0,-1,-1))
# outputs:
#    -1 0 1
# -1  2 0 0
# 0   0 2 0
# 1   0 0 2
#



