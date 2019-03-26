library(nlrx)


### Name: simdesign_distinct
### Title: Add a distinct simdesign to a nl object
### Aliases: simdesign_distinct

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

nl <- nl_distinct
nl@simdesign <- simdesign_distinct(nl = nl, nseeds = 3)





