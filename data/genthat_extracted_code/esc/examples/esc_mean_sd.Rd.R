library(esc)


### Name: esc_mean_sd
### Title: Compute effect size from Mean and Standard Deviation
### Aliases: esc_mean_sd

### ** Examples

# with standard deviations for each group
esc_mean_sd(grp1m = 7, grp1sd = 2, grp1n = 50,
            grp2m = 9, grp2sd = 3, grp2n = 60, es.type = "logit")

# with full sample standard deviations
esc_mean_sd(grp1m = 7, grp1n = 50, grp2m = 9, grp2n = 60, totalsd = 4)




