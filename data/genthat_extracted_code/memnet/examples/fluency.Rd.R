library(memnet)


### Name: fluency
### Title: Repeated verbal fluency generator.
### Aliases: fluency

### ** Examples

# generate watts strogatz graph
network = grow_ws(n = 100, k = 3)

# create verbal fluency sequences
fluency(get_adjlist(network), c(10, 10))

# create verbal fluency sequence
# with high jump probability
fluency(get_adjlist(network), c(10, 10), pjump = .5)




