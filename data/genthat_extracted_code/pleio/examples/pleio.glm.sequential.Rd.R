library(pleio)


### Name: pleio.glm.sequential
### Title: Perform sequential tests of pleiotropy
### Aliases: pleio.glm.sequential

### ** Examples

data(pleio.demo)

## test without covars
fams <- c("gaussian","binomial","ordinal")
obj <- pleio.glm.fit(y, geno, glm.family=fams)
stat <- pleio.glm.test(obj, count.nonzero.coef = 0)
stat$stat
stat$pval
pseq <- pleio.glm.sequential(obj, pval.threshold=.5)
pseq



