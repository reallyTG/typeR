library(memnet)


### Name: ffluency
### Title: Fast verbal fluency generator
### Aliases: ffluency

### ** Examples

# generate watts strogatz graph
network = grow_ws(n = 100, k = 10)

# create verbal fluency sequences
ffluency(get_adjlist(network), c(10, 10))

# create verbal fluency sequence
# with high jump probability
ffluency(get_adjlist(network), c(10, 10), pjump = .5)




