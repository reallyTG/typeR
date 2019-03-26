library(alphabetr)


### Name: create_data_singlecells
### Title: Simulate sequencing data obtained single-cell sequencing
### Aliases: create_data_singlecells

### ** Examples

 # see the help for create_clones() for details of this function call
 clones <- create_clones(numb_beta = 1000,
                      dual_alpha = .3,
                      dual_beta  = .06,
                      alpha_sharing = c(0.80, 0.15, 0.05),
                      beta_sharing  = c(0.75, 0.20, 0.05))

 # creating a data set with 480 single cells, lognormal error rates, 10 clones
 # making up the top 60% of the population in frequency, and a constant
 # sampling strategy of 50 cells per well for 480 wells (five 96-well plates)
 dat <- create_data_singlecells(clones$TCR, plate = 5,
                                error_drop = c(.15, .01),
                                error_seq  = c(.05, .001),
                                error_mode = c("lognormal", "lognormal"),
                                skewed = 10,
                                prop_top = 0.6,
                                dist = "linear")





