library(nlrx)


### Name: simdesign_simple
### Title: Add a simple simdesign to a nl object
### Aliases: simdesign_simple

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

nl <- nl_simple
nl@simdesign <- simdesign_simple(nl = nl, nseeds = 3)





