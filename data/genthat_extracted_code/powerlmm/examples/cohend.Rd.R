library(powerlmm)


### Name: cohend
### Title: Use Cohen's d as the effect size in 'study_parameters'
### Aliases: cohend

### ** Examples


# Pretest SD
p <- study_parameters(n1 = 11,
                      n2 = 20,
                      icc_pre_subject = 0.5,
                      cor_subject = -0.4,
                      var_ratio = 0.03,
                      effect_size = cohend(0.4, standardizer = "pretest_SD"))

get_slope_diff(p)

# using posttest SD,
# due to random slope SD will be larger at posttest
# thus ES = 0.4 indicate larger raw slope difference
# using posttest SD
p <- update(p, effect_size = cohend(0.4,
                                    standardizer = "posttest_SD"))
get_slope_diff(p)


# Random slope SD
p <- study_parameters(n1 = 11,
                      n2 = 20,
                      icc_pre_subject = 0.5,
                      cor_subject = -0.4,
                      var_ratio = 0.03,
                      effect_size = cohend(0.4, standardizer = "slope_SD"))

# Partially nested ----------------------------------------------------------
p <- study_parameters(n1 = 11,
                      n2 = 20,
                      n3 = 4,
                      icc_pre_subject = 0.5,
                      icc_pre_cluster = 0.25,
                      cor_subject = -0.4,
                      var_ratio = 0.03,
                      partially_nested = TRUE,
                      effect_size = cohend(0.4, standardizer = "pretest_SD")
                      )
# Default is to use control groups SD
get_slope_diff(p)

# Treatment group's SD also include cluster-level intercept variance.
# Thus, ES of 0.4 will indicate a larger raw difference
# using the treatment group's SD
p <- update(p, effect_size = cohend(0.4,
                                    standardizer = "pretest_SD",
                                    treatment = "treatment"))
get_slope_diff(p)

## Combine multiple values, and raw and standardized effects ----------------
p <- study_parameters(n1 = 11,
                      n2 = 20,
                      icc_pre_subject = 0.5,
                      cor_subject = -0.4,
                      var_ratio = 0.03,
                      effect_size = c(-5, 9,
                                      cohend(c(0.5, 0.8), standardizer = "pretest_SD"),
                                      cohend(c(0.5, 0.8), standardizer = "posttest_SD")))


## Recreate results in Raudenbush & Liu 2001 --------------------------------
rauden_liu <- function(D, f, n = 238) {
    n1 <- f * D + 1
    p <- study_parameters(n1 = n1,
                          n2 = n/2,
                          T_end = D,
                          sigma_subject_intercept = sqrt(0.0333),
                          sigma_subject_slope = sqrt(0.0030),
                          sigma_error = sqrt(0.0262),
                          effect_size = cohend(0.4, standardizer = "slope_SD"))
    x <- get_power(p)
    round(x$power, 2)
}

## Table 1 in Raudenbush & Liu 2001
## NB, it looks like they made an error in column 1.
g <- expand.grid(D = 2:8,
                 f = c(0.5, 1:6))
g$power <- mapply(rauden_liu, D = g$D, f = g$f)
tidyr::spread(g, f, power)


## Table 3 Table 1 in Raudenbush & Liu 2001
g <- expand.grid(n = seq(100, 800, by = 100),
                 D = 4,
                 f = c(0.5, 1:6))
g$power <- mapply(rauden_liu, n = g$n, f = g$f, D = g$D)
tidyr::spread(g, n, power)




