library(cusum)


### Name: racusum
### Title: Risk-adjusted CUSUM Charts
### Aliases: racusum

### ** Examples

# Patients risks are usually known from Phase I.
# If not, these risk scores can be simulated.

# define possible patient risk scores
risks <- c(0.001,0.01,0.1,0.002,0.02,0.2)

# sample risk population of size n = 100
set.seed(2046)
patient_risks <- sample(x = risks, size = 100, replace = TRUE)

# control limit can be obtained with racusum_CL_sim(),
# here it is set to an arbitrary value (2.96)

##### RA-CUSUM of in-control process
# simulate patient outcome for performace as expected
set.seed(2046)
patient_outcomes <- as.logical(rbinom(n = 100,
    size = 1,
    prob = patient_risks))

racusum(patient_risks,
    patient_outcomes,
    limit = 2.96)

#### RA-CUSUM of out-of-control process
# simulate patient outcome for deviating performance

set.seed(2046)
patient_outcomes <- as.logical(rbinom(n = 100, size = 1, prob = patient_risks * 2))
#'
racusum(patient_risks,
    patient_outcomes,
    limit = 2.96)




