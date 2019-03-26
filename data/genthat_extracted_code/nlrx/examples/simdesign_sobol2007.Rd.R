library(nlrx)


### Name: simdesign_sobol2007
### Title: Add a sobol2007 simdesign to a nl object
### Aliases: simdesign_sobol2007

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

nl <- nl_sobol2007
nl@simdesign <- simdesign_sobol2007(nl=nl,
samples=1000,
sobolnboot=100,
sobolconf=0.95,
nseeds=3,
precision=3)





