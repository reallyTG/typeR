library(powerlmm)


### Name: unequal_clusters
### Title: Setup unbalanced cluster sizes
### Aliases: unequal_clusters

### ** Examples

library(dplyr)
n2 <- unequal_clusters(5, 10, 15, 40)
p <- study_parameters(n1 = 11,
                      n2 = n2,
                      n3 = 6,
                      T_end = 10,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0,
                      sigma_error = 1,
                      var_ratio = 0.03,
                      icc_slope = 0.05,
                      cohend = -0.8)

# verify cluster sizes
d <- simulate_data(p)
d %>%
    filter(time == 0) %>%
    group_by(treatment, cluster) %>%
    summarise(n = n())

# Poisson distributed cluster sizes, same in both groups
n2 <- unequal_clusters(func = rpois(n = 5, lambda = 5))
p <- study_parameters(n1 = 11,
                      n2 = n2,
                      T_end = 10,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0,
                      sigma_error = 1,
                      var_ratio = 0.03,
                      icc_slope = 0.05,
                      cohend = -0.8)

# Independent draws from same dist
n2 <- unequal_clusters(func = rpois(n = 5, lambda = 5))
p <- study_parameters(n1 = 11,
                      n2 = per_treatment(n2, n2),
                      T_end = 10,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0,
                      sigma_error = 1,
                      var_ratio = 0.03,
                      icc_slope = 0.05,
                      cohend = -0.8)

# Use per_treatment() to specify per treatment ------------------------------
n2 <- per_treatment(unequal_clusters(2, 2, 2, 2, 3, 4, 5),
                     unequal_clusters(10, 15))
p <- study_parameters(n1 = 11,
                      n2 = n2,
                      n3 = 3,
                      T_end = 10,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0,
                      var_ratio = 0.03,
                      icc_slope = 0.05,
                      cohend = -0.8)

# verify cluster sizes
d <- simulate_data(p)
d %>%
    filter(time == 0) %>%
    group_by(treatment, cluster) %>%
    summarise(n = n())



