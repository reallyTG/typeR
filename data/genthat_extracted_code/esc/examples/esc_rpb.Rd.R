library(esc)


### Name: esc_rpb
### Title: Compute effect size from Point-Biserial Correlation
### Aliases: esc_rpb

### ** Examples

# unequal sample size
esc_rpb(r = .3, grp1n = 100, grp2n = 150)

# equal sample size
esc_rpb(r = .3, totaln = 200)

# unequal sample size, with p-value
esc_rpb(p = 0.03, grp1n = 100, grp2n = 150)

# equal sample size, with p-value
esc_rpb(p = 0.03, totaln = 200)




