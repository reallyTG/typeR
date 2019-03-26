library(randomizr)


### Name: obtain_condition_probabilities
### Title: Obtain the probabilities of units being in the conditions that
###   they are in.
### Aliases: obtain_condition_probabilities

### ** Examples


# Conduct a block random assignment
blocks <- rep(c("A", "B","C"), times=c(50, 100, 200))
block_m_each <- rbind(c(10, 40),
                 c(30, 70),
                 c(50, 150))
declaration <- declare_ra(blocks = blocks, block_m_each = block_m_each)
Z <- conduct_ra(declaration = declaration)
table(Z, blocks)

observed_probabilities <-
   obtain_condition_probabilities(declaration = declaration, assignment = Z)


# Probabilities in the control group:
table(observed_probabilities[Z == 0], blocks[Z == 0])

# Probabilities in the treatment group:
table(observed_probabilities[Z == 1], blocks[Z == 1])


# Sometimes it is convenient to skip the declaration step
Z <- conduct_ra(blocks = blocks, block_m_each = block_m_each)
observed_probabilities <-
   obtain_condition_probabilities(assignment = Z,
                                  blocks = blocks,
                                  block_m_each = block_m_each)
table(observed_probabilities[Z == 0], blocks[Z == 0])
table(observed_probabilities[Z == 1], blocks[Z == 1])




