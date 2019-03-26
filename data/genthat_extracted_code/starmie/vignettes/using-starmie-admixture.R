## ----setup, echo=FALSE---------------------------------------------------
knitr::opts_chunk$set(tidy = TRUE, 
                      fig.align = 'center', fig.width = 8, fig.height = 6)

## ----admix-read----------------------------------------------------------
library(starmie)
# get Q and P files for K = 3
p3 <- system.file("extdata/hapmap3_files", "hapmap3.3.P", package = "starmie")
q3 <- system.file("extdata/hapmap3_files", "hapmap3.3.Q", package = "starmie")

k3_admix <- loadAdmixture(q3, p3)
k3_admix

## ----admix-log-----------------------------------------------------------
k3_log <- system.file("extdata/hapmap3_files", "log3.out", package = "starmie")

k3_admix <- loadAdmixture(q3, p3, k3_log)
k3_admix

## ----admix-object, echo=FALSE--------------------------------------------
list_names <- names(k3_admix)
list_description <- c("K parameter supplied to ADMIXTURE",
                      "Number of samples",
                      "Number of markers",
                      "Individual ancestral probability of membership to cluster",
                      "Estimated ancestral allele frequencies for each cluster",
                      "Model fit statistics")

knitr::kable(data.frame(attributes = list_names, 
                        description = list_description))

## ----plotbar-------------------------------------------------------------
plotBar(k3_admix)

## ----plotbar2------------------------------------------------------------
plotBar(k3_admix, facet = FALSE)

## ----multirun------------------------------------------------------------
admix_multi <- exampleAdmixture()
admix_multi

## ------------------------------------------------------------------------
bestK(admix_multi)

## ------------------------------------------------------------------------
sessionInfo()


