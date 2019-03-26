library(exactRankTests)


### Name: rotarod
### Title: Rotating Rats Data
### Aliases: rotarod
### Keywords: datasets

### ** Examples

data(rotarod)
wilcox.exact(time ~ group, data=rotarod, alternative="g")
wilcox.exact(time ~ group, data=rotarod, conf.int=TRUE)
wilcox.exact(time ~ group, data=rotarod, exact=FALSE)
# the permutation test
perm.test(time ~ group, data=rotarod)
perm.test(time ~ group, data=rotarod, exact=FALSE)



