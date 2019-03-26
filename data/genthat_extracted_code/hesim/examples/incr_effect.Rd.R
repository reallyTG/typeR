library(hesim)


### Name: incr_effect
### Title: Incremental treatment effect
### Aliases: incr_effect

### ** Examples

# simulation output
nsims <- 100
sim <- data.frame(sim = rep(seq(nsims), 4),
             c = c(rlnorm(nsims, 5, .1), rlnorm(nsims, 5, .1),
                    rlnorm(nsims, 11, .1), rlnorm(nsims, 11, .1)),
             e = c(rnorm(nsims, 8, .2), rnorm(nsims, 8.5, .1),
                   rnorm(nsims, 11, .6), rnorm(nsims, 11.5, .6)),
             strategy = rep(paste0("Strategy ", seq(1, 2)),
                           each = nsims * 2),
             grp = rep(rep(c("Group 1", "Group 2"),
                           each = nsims), 2)
)
# calculate incremental effect of Strategy 2 relative to Strategy 1 by group
incr.effect <- incr_effect(sim, comparator = "Strategy 1", sim = "sim",
                        strategy = "strategy", grp = "grp", outcomes = c("c", "e"))
head(incr.effect)



