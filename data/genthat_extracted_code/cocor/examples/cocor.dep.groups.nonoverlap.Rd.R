library(cocor)


### Name: cocor.dep.groups.nonoverlap
### Title: Compare two nonoverlapping correlations based on dependent
###   groups
### Aliases: cocor.dep.groups.nonoverlap

### ** Examples

# Compare the difference between the correlations (age, intelligence) and
# body mass (index, shoe size) measured in the same group (all values are fictional):
r.jk <- .2  # Correlation (age, intelligence)
r.hm <- .7  # Correlation (body mass index, shoe size)
r.jh <- .4  # Correlation (age, body mass index)
r.jm <- .5  # Correlation (age, shoe size)
r.kh <- .1  # Correlation (intelligence, body mass index)
r.km <- .3  # Correlation (intelligence, shoe size)
n <- 232  # Size of the group

cocor.dep.groups.nonoverlap(r.jk, r.hm, r.jh, r.jm, r.kh, r.km, n,
var.labels=c("age", "intelligence", "body mass index", "shoe size"))




