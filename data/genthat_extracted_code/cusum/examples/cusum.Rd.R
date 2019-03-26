library(cusum)


### Name: cusum
### Title: Non-risk-adjusted CUSUM Charts
### Aliases: cusum

### ** Examples


# control limit can be obtained with cusum_limit_sim(),
# here it is set to an arbitrary value (2.96)

# CUSUM of in-control process
# simulate patient outcomes
set.seed(2046)
patient_outcomes <- as.logical(rbinom(n = 100, size = 1, prob = 0.05))


cs_ic <- cusum(failure_probability = 0.05,
    patient_outcomes,
    limit = 2.96)

# CUSUM of out-of-control process
# simulate patient outcome
set.seed(2046)
patient_outcomes <- as.logical(rbinom(n = 100, size = 1, prob = 0.2))

cs_oc <- cusum(failure_probability = 0.05,
    patient_outcomes,
    limit = 2.96)



