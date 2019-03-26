library(memnet)


### Name: one_ffluency
### Title: Fast verbal fluency generator
### Aliases: one_ffluency

### ** Examples

# generate watts strogatz graph
network = grow_ws(n = 100, k = 10)

# create verbal fluency sequences
one_ffluency(get_adjlist(network),  10)

# create verbal fluency sequence
# with high jump probability
one_ffluency(get_adjlist(network), 10, pjump = .5)




