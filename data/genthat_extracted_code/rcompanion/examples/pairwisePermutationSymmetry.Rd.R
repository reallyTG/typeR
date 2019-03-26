library(rcompanion)


### Name: pairwisePermutationSymmetry
### Title: Pairwise two-sample permutation symmetry tests
### Aliases: pairwisePermutationSymmetry

### ** Examples

data(BobBelcher)
BobBelcher$Instructor = factor( BobBelcher$Instructor, 
                  levels = c("Linda Belcher", "Louise Belcher",
                             "Tina Belcher", "Bob Belcher",
                             "Gene Belcher"))
BobBelcher$Likert.f = factor(BobBelcher$Likert, ordered=TRUE)
PT = pairwisePermutationSymmetry(Likert.f ~ Instructor | Rater,
                                 data      = BobBelcher,
                                 method = "fdr")
PT
cldList(comparison = PT$Comparison,
        p.value    = PT$p.adjust,
        threshold  = 0.05)




