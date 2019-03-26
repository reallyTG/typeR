library(powerlmm)


### Name: get_ICC_pre_clusters
### Title: Calculate the amount of baseline variance at the cluster level
### Aliases: get_ICC_pre_clusters

### ** Examples

paras <- study_parameters(n1 = 11,
                          n2 = 10,
                          n3 = 3,
                          T_end = 10,
                          sigma_subject_intercept = 1.2,
                          sigma_subject_slope = 0.2,
                          sigma_cluster_intercept = 0.5,
                          sigma_cluster_slope = 0.2,
                          sigma_error = 1.2,
                          cohend = -0.8)

get_ICC_pre_clusters(paras)



