library(rcompanion)


### Name: pairwiseNominalMatrix
### Title: Pairwise tests of independence for nominal data with matrix
###   output
### Aliases: pairwiseNominalMatrix

### ** Examples

### Independence test for a 4 x 2 matrix
data(Anderson)
fisher.test(Anderson)
Anderson = Anderson[(c("Heimlich", "Bloom", "Dougal", "Cobblestone")),]
PT = pairwiseNominalMatrix(Anderson,
                           fisher = TRUE,
                           gtest  = FALSE,
                           chisq  = FALSE)$Adjusted
PT
library(multcompView)
multcompLetters(PT)
                                                              



