library(epitools)


### Name: epitab
### Title: Epidemiologic tabulation for a cohort or case-control study
### Aliases: epitab
### Keywords: models

### ** Examples

r243 <- matrix(c(12,2,7,9), 2, 2)
dimnames(r243) <- list(Diarrhea = c("Yes", "No"),
                      "Antibody level" = c("Low", "High")
                      )
r243
r243b <- t(r243)
r243b
epitab(r243, rev = "b", verbose = TRUE)
epitab(r243, method="riskratio",rev = "b", verbose = TRUE)
epitab(matrix(c(41, 15, 28010, 19017),2,2)[2:1,],
       method="rateratio", verbose = TRUE)




