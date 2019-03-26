library(alphabetr)


### Name: chain_scores
### Title: Calculate association scores between alpha and beta chain pairs.
### Aliases: chain_scores

### ** Examples

 # see the help for create_clones() and create_data()
 clones <- create_clones(numb_beta = 1000,
                         dual_alpha = .3,
                         dual_beta  = .06,
                         alpha_sharing = c(0.80, 0.15, 0.05),
                         beta_sharing  = c(0.75, 0.20, 0.05))
 dat <- create_data(clones$TCR, plate = 5,
                    error_drop = c(.15, .01),
                    error_seq  = c(.05, .001),
                    error_mode = c("lognormal", "lognormal"),
                    skewed = 10,
                    prop_top = 0.6,
                    dist = "linear",
                    numb_cells = matrix(c(50, 480), ncol = 2))

 #this is done internally in bagpipe()
 scores <- chain_scores(data_a = dat$alpha, data_b = dat$beta)
 scores <- scores$ascores + t(scores$bscores)




