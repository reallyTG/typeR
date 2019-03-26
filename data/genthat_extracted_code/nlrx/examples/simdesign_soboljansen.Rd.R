library(nlrx)


### Name: simdesign_soboljansen
### Title: Add a soboljansen simdesign to a nl object
### Aliases: simdesign_soboljansen

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

nl <- nl_soboljansen
nl@simdesign <- simdesign_soboljansen(nl=nl,
samples=1000,
sobolnboot=100,
sobolconf=0.95,
nseeds=3,
precision=3)





