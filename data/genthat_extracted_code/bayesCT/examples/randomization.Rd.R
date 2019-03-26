library(bayesCT)


### Name: randomization
### Title: Randomization allocation
### Aliases: randomization

### ** Examples

# Implementing treatment allocation for control to treatment with 1:1.5 randomization ratio
randomization(N_total = 100, block = 5, allocation = c(2, 3))

# Treatment allocation with 2:1 for control to treatment
randomization(N_total = 70, block = 9, allocation = c(2, 1))

# Treatment allocation for control to treatment with 1:2 for control to treatment with
# multiple block sizes c(3, 9, 6)
randomization(N_total = 100, block = c(3, 9, 6), allocation = c(1, 2))

# For complete randomization set the N_total to block size
randomization(N_total = 100, block = 100, allocation = c(1, 1))




