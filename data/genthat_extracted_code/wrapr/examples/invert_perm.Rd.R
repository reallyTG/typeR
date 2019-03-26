library(wrapr)


### Name: invert_perm
### Title: Invert a permutation.
### Aliases: invert_perm

### ** Examples


p <- c(4, 5, 7, 8, 9, 6, 1, 3, 2, 10)
q <- invert_perm(p)
p[q]
all.equal(p[q], seq_len(length(p)))
q[p]
all.equal(q[p], seq_len(length(p)))




