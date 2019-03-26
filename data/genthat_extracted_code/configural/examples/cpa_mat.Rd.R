library(configural)


### Name: cpa_mat
### Title: Conduct criterion profile analysis using a correlation matrix
### Aliases: cpa_mat

### ** Examples

sevar <- cor_covariance_meta(mindfulness$r, mindfulness$n, mindfulness$sevar_r, mindfulness$source)
cpa_mat(mindfulness ~ ES + A + C + Ex + O,
          cov_mat = mindfulness$rho,
          n = harmonic_mean(vechs(mindfulness$n)),
          se_var_mat = sevar,
          adjust = "pop")



