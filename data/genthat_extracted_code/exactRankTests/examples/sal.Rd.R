library(exactRankTests)


### Name: sal
### Title: Serum Antigen Level
### Aliases: sal
### Keywords: datasets

### ** Examples

data(sal)
attach(sal)

wilcox.exact(pre, post, paired=TRUE, conf.int=TRUE)
wilcox.exact(pre,post, paired=TRUE, conf.int=TRUE, exact=FALSE)

detach(sal)




