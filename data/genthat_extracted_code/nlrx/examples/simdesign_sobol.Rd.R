library(nlrx)


### Name: simdesign_sobol
### Title: Add a sobol simdesign to a nl object
### Aliases: simdesign_sobol

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

nl <- nl_sobol
nl@simdesign <- simdesign_sobol(nl=nl,
samples=1000,
sobolorder=2,
sobolnboot=100,
sobolconf=0.95,
nseeds=3,
precision=3)





