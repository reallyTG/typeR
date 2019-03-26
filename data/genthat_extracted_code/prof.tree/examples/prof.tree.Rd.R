library(prof.tree)


### Name: prof.tree
### Title: Summarise Output of R Sampling Profiler
### Aliases: print.ProfTree prof.tree

### ** Examples

Rprof(tmp <- tempfile())
example(glm)
Rprof(NULL)
tree <- prof.tree(tmp)
print(tree, limit = 20)
unlink(tmp)




