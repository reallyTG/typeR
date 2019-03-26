library(noncomplyR)


### Name: compliance_chain
### Title: Data Augmentation for Non-compliance analysis
### Aliases: compliance_chain

### ** Examples

# runs 10 iterations of the data augmentation algorithm on a subset of the vitaminA data
set.seed(4923)
compliance_chain(vitaminA[sample(1:nrow(vitaminA), 1000),], outcome_model = "binary",
exclusion_restriction = TRUE, strong_access = TRUE, n_iter = 10, n_burn = 1)




