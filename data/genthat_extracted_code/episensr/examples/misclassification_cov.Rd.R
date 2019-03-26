library(episensr)


### Name: misclassification_cov
### Title: Sensitivity analysis for covariate misclassification.
### Aliases: misclassification_cov

### ** Examples

# The data for this example come from:
# Berry, R.J., Kihlberg, R., and Devine, O. Impact of misclassification of in vitro
# fertilisation in studies of folic acid and twinning: modelling using population
# based Swedish vital records.
# BMJ, doi:10.1136/bmj.38369.437789.82 (published 17 March 2004)
misclassification_cov(array(c(1319, 38054, 5641, 405546,
565, 3583, 781, 21958,
754, 34471, 4860, 383588),
dimnames = list(c("Twins+", "Twins-"),
c("Folic acid+", "Folic acid-"), c("Total", "IVF+", "IVF-")),
dim = c(2, 2, 3)),
bias_parms = c(.6, .6, .95, .95))



