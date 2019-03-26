library(configural)


### Name: fungible.cpa
### Title: Locate extrema of fungible criterion profile patterns
### Aliases: fungible.cpa

### ** Examples

mind <- cpa_mat(mindfulness ~ ES + A + C + Ex + O,
                cov_mat = mindfulness$r,
                n = harmonic_mean(vechs(mindfulness$n)),
                se_var_mat = cor_covariance_meta(mindfulness$r,
                                                 mindfulness$n,
                                                 mindfulness$sevar_r,
                                                 mindfulness$source),
                adjust = "pop")
mind_fung <- fungible(mind, Nstarts = 100)



