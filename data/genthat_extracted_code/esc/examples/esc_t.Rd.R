library(esc)


### Name: esc_t
### Title: Compute effect size from Student's t-test
### Aliases: esc_t

### ** Examples

# unequal sample size
esc_t(t = 3.3, grp1n = 100, grp2n = 150)

# equal sample size
esc_t(t = 3.3, totaln = 200)

# unequal sample size, with p-value
esc_t(p = 0.03, grp1n = 100, grp2n = 150)

# equal sample size, with p-value
esc_t(p = 0.03, totaln = 200)




