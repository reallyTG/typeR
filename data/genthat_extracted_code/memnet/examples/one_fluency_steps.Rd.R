library(memnet)


### Name: one_fluency_steps
### Title: Verbal fluency step counter
### Aliases: one_fluency_steps

### ** Examples

# generate watts strogatz graph
network = grow_ws(n = 100, k = 10)

# count number of steps needed to create sequence
one_fluency_steps(get_adjlist(network), 10)

# count number of steps needed to create sequence
# with high jump probability
one_fluency_steps(get_adjlist(network), 10, pjump = .5)




