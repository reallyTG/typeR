library(hesim)


### Name: custom_table
### Title: Custom CEA summary table
### Aliases: custom_table

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

# Custom summary table
custom.fun <- function(x) list(mean = mean(x), median = median(x),
                             quantile(x, c(.025, .975)))
custom_table(sim, strategy = "strategy", grp = "grp",
           custom_vars = "e", FUN = custom.fun)



