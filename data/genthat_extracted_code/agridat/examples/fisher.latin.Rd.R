library(agridat)


### Name: fisher.latin
### Title: Latin square experiment on mangolds
### Aliases: fisher.latin
### Keywords: datasets

### ** Examples


data(fisher.latin)
dat <- fisher.latin

# Standard latin-square analysis
m1 <- lm(yield ~ trt + factor(row) + factor(col), data=dat)
anova(m1)




