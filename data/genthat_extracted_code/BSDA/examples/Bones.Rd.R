library(BSDA)


### Name: Bones
### Title: Bone density measurements of 35 physically active and 35
###   non-active women
### Aliases: Bones
### Keywords: datasets

### ** Examples


t.test(density ~ group, data = Bones, alternative = "greater")
t.test(rank(density) ~ group, data = Bones, alternative = "greater")
wilcox.test(density ~ group, data = Bones, alternative = "greater")





