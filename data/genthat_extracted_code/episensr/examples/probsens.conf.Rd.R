library(episensr)


### Name: probsens.conf
### Title: Probabilistic sensitivity analysis for unmeasured confounding.
### Aliases: probsens.conf

### ** Examples

# The data for this example come from:
# Tyndall M.W., Ronald A.R., Agoki E., Malisa W., Bwayo J.J., Ndinya-Achola J.O. et al.
# Increased risk of infection with human immunodeficiency virus type 1 among
# uncircumcised men presenting with genital ulcer disease in Kenya.
# Clin Infect Dis 1996;23:449-53.
set.seed(123)
probsens.conf(matrix(c(105, 85, 527, 93),
dimnames = list(c("HIV+", "HIV-"), c("Circ+", "Circ-")), nrow = 2, byrow = TRUE),
reps = 20000,
prev.exp = list("triangular", c(.7, .9, .8)),
prev.nexp = list("trapezoidal", c(.03, .04, .05, .06)),
risk = list("triangular", c(.6, .7, .63)),
corr.p = .8)



