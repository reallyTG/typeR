library(memnet)


### Name: one_fluency
### Title: Verbal fluency generator
### Aliases: one_fluency

### ** Examples

# generate watts strogatz graph
network = grow_ws(n = 100, k = 10)

# create verbal fluency sequence
one_fluency(get_adjlist(network), 10)

# create verbal fluency sequence
# with high jump probability
one_fluency(get_adjlist(network), 10, pjump = .5)




