library(nlrx)


### Name: simdesign_morris
### Title: Add a morris elementary effects simdesign to a nl object
### Aliases: simdesign_morris

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

nl <- nl_morris
nl@simdesign <- simdesign_morris(nl=nl,
                                  morristype="oat",
                                  morrislevels=4,
                                  morrisr=20,
                                  morrisgridjump=2,
                                  nseeds=3)





