library(nlrx)


### Name: simdesign_eFast
### Title: Add an eFast simdesign to a nl object
### Aliases: simdesign_eFast

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

nl <- nl_eFast
nl@simdesign <- simdesign_eFast(nl=nl,
                                 samples=100,
                                 nseeds=1)





