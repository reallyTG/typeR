library(rcompanion)


### Name: pairwisePermutationSymmetryMatrix
### Title: Pairwise two-sample permutation symmetry tests with matrix
###   output
### Aliases: pairwisePermutationSymmetryMatrix

### ** Examples

data(BobBelcher)
BobBelcher$Instructor = factor( BobBelcher$Instructor, 
                  levels = c("Linda Belcher", "Louise Belcher",
                             "Tina Belcher", "Bob Belcher",
                             "Gene Belcher"))
BobBelcher$Likert.f = factor(BobBelcher$Likert, ordered=TRUE)
PT = pairwisePermutationSymmetryMatrix(Likert.f ~ Instructor | Rater,
                                       data   = BobBelcher,
                                       method = "fdr")$Adjusted
PT
library(multcompView)
multcompLetters(PT,
                compare="<",
                threshold=0.05,
                Letters=letters)   




