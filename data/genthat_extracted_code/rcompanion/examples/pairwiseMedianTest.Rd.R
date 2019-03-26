library(rcompanion)


### Name: pairwiseMedianTest
### Title: Pairwise Mood's median tests
### Aliases: pairwiseMedianTest

### ** Examples

data(PoohPiglet)
PoohPiglet$Speaker = factor(PoohPiglet$Speaker,
                     levels = c("Pooh", "Tigger", "Piglet"))
PT = pairwiseMedianTest(Likert ~ Speaker,
                        data   = PoohPiglet,
                        exact  = NULL,
                        method = "fdr")
PT                         
cldList(comparison = PT$Comparison,
        p.value    = PT$p.adjust,
        threshold  = 0.05)                         




