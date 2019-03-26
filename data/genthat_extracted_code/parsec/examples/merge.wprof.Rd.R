library(parsec)


### Name: merge.wprof
### Title: Merge two sets of profiles.
### Aliases: merge.wprof

### ** Examples

n <- 5
v1 <- as.ordered(c("a", "b", "c", "d"))
v2 <- 1:3
set.seed(0)
pop <- data.frame(
	v1 = sample(v1, n, replace = TRUE),
	v2 = sample(v2, n, replace = TRUE)
)

survey_weights <- round(runif(5)*10)

prof1 <- pop2prof(pop, weights = survey_weights)
prof2 <- var2prof(varmod = list(v1 = as.ordered(c("a", "b", "c", "d")), v2 = 1:3))

# prof2 is the support of prof1
merge(prof1, prof2, support = TRUE)

# union between the two sets of profiles and their frequencies are added
merge(prof1, prof2)

# intersection of the sets of profiles with the assumption
# that the minimum number of observations is shared
# between the two distributions
merge(prof1, prof2, all = FALSE, FUN = min)

prof2$freq <- prof2$freq*10
# to remove from prof2 the observations in prof1
distribution <- merge(prof2, prof1, FUN = "-"); distribution



