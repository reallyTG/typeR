library(quanteda)


### Name: dfm_group
### Title: Combine documents in a dfm by a grouping variable
### Aliases: dfm_group

### ** Examples

mycorpus <- corpus(c("a a b", "a b c c", "a c d d", "a c c d"),
                   docvars = data.frame(grp = c("grp1", "grp1", "grp2", "grp2")))
mydfm <- dfm(mycorpus)
dfm_group(mydfm, groups = "grp")
dfm_group(mydfm, groups = c(1, 1, 2, 2))

# equivalent
dfm(mydfm, groups = "grp")
dfm(mydfm, groups = c(1, 1, 2, 2))



