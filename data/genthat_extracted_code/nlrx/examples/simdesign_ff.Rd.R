library(nlrx)


### Name: simdesign_ff
### Title: Add a full-factorial simdesign to a nl object
### Aliases: simdesign_ff

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

nl <- nl_ff
nl@simdesign <- simdesign_ff(nl = nl, nseeds = 3)





