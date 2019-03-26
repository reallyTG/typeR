## ----setup, echo=FALSE---------------------------------------------------
knitr::opts_chunk$set(tidy = TRUE, 
                      fig.align = 'center', fig.width = 8, fig.height = 6)

## ----parallel-structure, eval=FALSE--------------------------------------
#  input_file <- system.file("inst/extdata/microsat_testfiles", "locprior.str", package = "starmie")
#  main_params <- system.file("inst/extdata/microsat_testfiles", "mainparams", package = "starmie")
#  extra_params <-  system.file("inst/extdata/microsat_testfiles", "extraparams", package = "starmie")
#  runStructure("path/to/structure", input_file, main_params, extra_params, "run", 5, 2, 2)
#  

## ----struct-example------------------------------------------------------
library(starmie)
# path to file name
k6_file <- system.file("extdata/microsat_testfiles/", "locprior_K6.out_f", 
                       package = "starmie")
# create struct object
k6_msat <- loadStructure(k6_file)

k6_msat

## ----struct-object, echo=FALSE-------------------------------------------
list_names <- names(k6_msat)
list_description <- c("K parameter supplied to STRUCTURE",
                      "Input parameters",
                      "Assigned cluster membership proportions",
                      "Pairwise Fst values between inferred clusters",
                      "Average nucleotide distance within clusters",
                      "Within cluster average Fst values",
                      "Model fit diagnositcs", 
                      "Individual ancestral probability of membership to cluster",
                      "Estimated ancestral allele frequencies for each cluster",
                      "MCMC burn-in diagnositcs",
                      "MCMC post burn-in diagnostics")

knitr::kable(data.frame(attributes = list_names, 
                        description = list_description))

## ----qhat----------------------------------------------------------------
Q_hat <- getQ(k6_msat)

## ----plot-bar------------------------------------------------------------
plotBar(k6_msat, facet = FALSE)

## ----plot-bar2-----------------------------------------------------------
plotBar(k6_msat)

## ----structList----------------------------------------------------------
k6_file_run2 <- system.file("extdata/microsat_testfiles/", 
                            "run2_locprior_K6.out_f", 
                       package = "starmie")

k6_run2 <- loadStructure(k6_file_run2)

k6_all <- structList(k6_msat, k6_run2)

k6_all

## ----plot-multiK---------------------------------------------------------
plotMultiK(k6_all)

## ----mcmc1---------------------------------------------------------------
multiple_runs_k10 <- exampleStructure("mcmc_diagnostics")

mcmc_out <-plotMCMC(multiple_runs_k10, facet = FALSE)

head(mcmc_out$mcmc_info)

## ----evanno-lyf----------------------------------------------------------
multi_K <- exampleStructure("multiple_runs")
bestK(multi_K)
bestK(multi_K, "structure")

## ----clump-example-------------------------------------------------------
Q_list <- lapply(k6_all, getQ)
clumpak_results <- clumpak(Q_list)

clumppy <- clumpp(Q_list, method = "greedy")

# plot the results
plotMultiK(clumppy$Q_list)

## ----plotMDS-------------------------------------------------------------
plotMDS(k6_msat)

## ----session-info--------------------------------------------------------
sessionInfo()

