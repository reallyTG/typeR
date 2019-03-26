library(rcompanion)


### Name: pairwiseNominalIndependence
### Title: Pairwise tests of independence for nominal data
### Aliases: pairwiseNominalIndependence

### ** Examples

### Independence test for a 4 x 2 matrix
data(Anderson)
fisher.test(Anderson)
Anderson = Anderson[(c("Heimlich", "Bloom", "Dougal", "Cobblestone")),]
PT = pairwiseNominalIndependence(Anderson,
                                 fisher = TRUE,
                                 gtest  = FALSE,
                                 chisq  = FALSE,
                                 cramer = TRUE)
PT                                
cldList(comparison = PT$Comparison,
        p.value    = PT$p.adj.Fisher,
        threshold  = 0.05)                             
                                                              



