library(qat)


### Name: qat_call_boot_distribution
### Title: Perform a bootstrapped distribution check
### Aliases: qat_call_boot_distribution
### Keywords: utilities

### ** Examples

vec <- rnorm(1000)
workflowlist_part <- list(bootruns=1000)
result <- qat_call_boot_distribution(vec, workflowlist_part)



