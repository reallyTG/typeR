library(starmie)


### Name: bestK
### Title: Determine a suitable K value from multiple Structure runs
### Aliases: bestK

### ** Examples

multi_K <- exampleStructure("multiple_runs")
# Run the evanno method and display diagnostic plots.
evanno_results <- bestK(multi_K, method = "evanno")
# Run the default structure method and display diagnostic plots
structure_results <- bestK(multi_K, "structure")
# find 'best' K according to results
deltaK <- evanno_results$variable == 'delta K'
max_deltaK <- which(evanno_results$value == max(evanno_results$value[deltaK], na.rm = TRUE))
evanno_results[max_deltaK, ]
lK <- structure_results$variable == 'L(K)'
max_Lk <- which(structure_results$value == max(structure_results$value[lK], na.rm = TRUE))
structure_results[max_Lk,]
# admixture example
multi_K_admix <- exampleAdmixture()
bestK(multi_K_admix)



