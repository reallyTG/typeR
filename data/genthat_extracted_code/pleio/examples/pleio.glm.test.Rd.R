library(pleio)


### Name: pleio.glm.test
### Title: Single test of the number of traits associated with genotype
### Aliases: pleio.glm.test

### ** Examples

data(pleio.demo)
obj <- pleio.glm.fit(y, geno, glm.family=c("gaussian","binomial","ordinal"))
test1 <- pleio.glm.test(obj, count.nonzero.coef = 0)
test1
test2 <- pleio.glm.test(obj, count.nonzero.coef = 1)
test2



