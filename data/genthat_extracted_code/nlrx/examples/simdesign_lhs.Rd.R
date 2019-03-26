library(nlrx)


### Name: simdesign_lhs
### Title: Add a latin-hypercube simdesign to a nl object
### Aliases: simdesign_lhs

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

nl <- nl_lhs
nl@simdesign <- simdesign_lhs(nl=nl,
                               samples=100,
                               nseeds=3,
                               precision=3)




