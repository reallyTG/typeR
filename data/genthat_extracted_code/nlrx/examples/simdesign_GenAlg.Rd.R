library(nlrx)


### Name: simdesign_GenAlg
### Title: Add a Genetic Algorithm simdesign to a nl object
### Aliases: simdesign_GenAlg

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

nl <- nl_lhs
nl@simdesign <- simdesign_GenAlg(nl=nl,
                                  nseeds=1)






