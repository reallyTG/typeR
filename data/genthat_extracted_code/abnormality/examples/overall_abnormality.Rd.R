library(abnormality)


### Name: overall_abnormality
### Title: Measure a Subject's Abnormality with Respect to a Reference
###   Population
### Aliases: overall_abnormality

### ** Examples

p = 100
Subj <- rep(1, p)
Reference_Population <- generate_correlated_matrix(100, p, corr = 0.75,constant_cov_matrix = TRUE)
overall_abnormality(Subj,Reference_Population)
overall_abnormality(Subj,Reference_Population,dist_measure = "Euclidean")
overall_abnormality(Subj,Reference_Population,stopping_rule = "TVE", TVE = .90)
overall_abnormality(Subj,Reference_Population,dist_measure = "Lk-Norm",k=.5,stopping_rule="brStick")




