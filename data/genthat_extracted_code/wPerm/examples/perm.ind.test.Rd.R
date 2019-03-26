library(wPerm)


### Name: perm.ind.test
### Title: Permutation Independence Test
### Aliases: perm.ind.test

### ** Examples

# Religious belief vs education for a sample of 509 people.
data("relig.and.ed")
str(relig.and.ed)
relig.and.ed
# Note that relig.and.ed is in the form of a flat contingency table ("flat").

# Permutation independence test to decide whether an association exists
# between religiosity and education, using 999 replications.
perm.ind.test(relig.and.ed, "flat", c("Religiosity", "Education"), 999)

# Social class vs nursery-rhyme knowledge for a sample of 66 grade-school
# children.
data("learning")
str(learning)
learning
# Note that the learning data is in the form of a contingency table ("cont").

# Permutation independence test to decide whether an association exists
# between social class and nursery-rhyme knowledge, using 999 replications.
perm.ind.test(learning, "cont", c("Social class", "Nursery-rhyme knowledge"), 999)
# Or, equivalently, since "cont" is the default "type":
perm.ind.test(learning, var.names = c("Social class", "Nursery-rhyme knowledge"), R = 999)



