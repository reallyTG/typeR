library(castor)


### Name: map_to_state_space
### Title: Map states of a discrete trait to integers.
### Aliases: map_to_state_space
### Keywords: algebra ancestral state reconstruction

### ** Examples

# generate a sequence of random states
unique_states = c("b","c","a")
raw_states = unique_states[sample.int(3,size=10,replace=TRUE)]

# map to integer state space
mapping = map_to_state_space(raw_states)

cat(sprintf("Checking that original unique states is the same as the one inferred:\n"))
print(unique_states)
print(mapping$state_names)

cat(sprintf("Checking reversibility of mapping:\n"))
print(raw_states)
print(mapping$state_names[mapping$mapped_states])



