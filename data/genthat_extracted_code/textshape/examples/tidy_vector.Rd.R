library(textshape)


### Name: tidy_vector
### Title: Tidy a Named Atomic Vector: Bind Its Values with Its Names
### Aliases: tidy_vector

### ** Examples

x <- setNames(sample(LETTERS[1:6], 1000, TRUE), sample(state.name[1:5], 1000, TRUE))
tidy_vector(x)



