library(memnet)


### Name: fluency_steps
### Title: Verbal fluency step counter
### Aliases: fluency_steps

### ** Examples

# generate watts strogatz graph
network = grow_ws(n = 100, k = 10)

# count number of steps needed to create sequence
fluency_steps(get_adjlist(network), c(10, 10))

# count number of steps needed to create sequence
# with high jump probability
fluency_steps(get_adjlist(network), c(10, 10), pjump = .5)




