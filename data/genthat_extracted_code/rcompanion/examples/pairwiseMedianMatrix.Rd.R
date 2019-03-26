library(rcompanion)


### Name: pairwiseMedianMatrix
### Title: Pairwise Mood's median tests with matrix output
### Aliases: pairwiseMedianMatrix

### ** Examples

data(PoohPiglet)
PoohPiglet$Speaker = factor(PoohPiglet$Speaker,
                          levels = c("Pooh", "Tigger", "Piglet"))
PT = pairwiseMedianMatrix(Likert ~ Speaker,
                          data   = PoohPiglet,
                          exact  = NULL,
                          method = "fdr")$Adjusted
PT                           
library(multcompView)
multcompLetters(PT,
                compare="<",
                threshold=0.05,
                Letters=letters)                    




