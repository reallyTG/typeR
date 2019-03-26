library(rcompanion)


### Name: pairwisePermutationTest
### Title: Pairwise two-sample permutation tests
### Aliases: pairwisePermutationTest

### ** Examples

data(PoohPiglet)
PoohPiglet$Speaker = factor(PoohPiglet$Speaker,
                     levels = c("Pooh", "Tigger", "Piglet"))
PT = pairwisePermutationTest(Likert ~   Speaker,
                             data   = PoohPiglet,
                             method = "fdr")
PT
cldList(comparison = PT$Comparison,
        p.value    = PT$p.adjust,
        threshold  = 0.05)




