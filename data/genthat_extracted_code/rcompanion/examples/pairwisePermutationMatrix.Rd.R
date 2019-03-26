library(rcompanion)


### Name: pairwisePermutationMatrix
### Title: Pairwise two-sample permutation tests with matrix output
### Aliases: pairwisePermutationMatrix

### ** Examples

data(PoohPiglet)
PoohPiglet$Speaker = factor(PoohPiglet$Speaker,
                     levels = c("Pooh", "Tigger", "Piglet"))            
PT = pairwisePermutationMatrix(Likert ~ Speaker,
                               data   = PoohPiglet,
                               method = "fdr")
PT
PT = PT$Adjusted
library(multcompView)
multcompLetters(PT,
                compare="<",
                threshold=0.05,
                Letters=letters)   




