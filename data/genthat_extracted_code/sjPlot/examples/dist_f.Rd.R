library(sjPlot)


### Name: dist_f
### Title: Plot F distributions
### Aliases: dist_f

### ** Examples

# a simple F distribution for 6 and 45 degrees of freedom
dist_f(deg.f1 = 6, deg.f2 = 45)

# F distribution for 6 and 45 degrees of freedom,
# and a shaded area starting at F value of two.
# F-values equal or greater than 2.31 are "significant"
dist_f(f = 2, deg.f1 = 6, deg.f2 = 45)

# F distribution for 6 and 45 degrees of freedom,
# and a shaded area starting at a p-level of 0.2
# (F-Value about 1.5).
dist_f(p = 0.2, deg.f1 = 6, deg.f2 = 45)




