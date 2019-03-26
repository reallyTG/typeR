library(wPerm)


### Name: perm.hom.test
### Title: Permutation Homogeneity Test
### Aliases: perm.hom.test

### ** Examples

# Self-concept for independent random samples of sighted and blind
# Indian adolescents.
data("self")
str(self)
self
# Note that self is in the form of a contingency table ("cont").

# Permutation homogeneity test to decide whether a difference exists in
# self-concept distributions between sighted and blind Indian adolescents,
# using 999 replications.
perm.hom.test(self, "cont", "Self-concept", 999)
# Or, equivalently, since "cont" is the default "type":
perm.hom.test(self, variable = "Self-concept", R = 999)



