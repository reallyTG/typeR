library(DesignLibrary)


### Name: multi_arm_designer
### Title: Create a design with multiple experimental arms
### Aliases: multi_arm_designer

### ** Examples


# To make a design using default arguments:
design <- multi_arm_designer()


# A design with different means and standard deviations in each arm
design <- multi_arm_designer(outcome_means = c(0, 0.5, 2), outcome_sds =  c(1, 0.1, 0.5))

design <- multi_arm_designer(N = 80, m_arms = 4, outcome_means = 1:4,
                             fixed = c("outcome_means", "outcome_sds"))




