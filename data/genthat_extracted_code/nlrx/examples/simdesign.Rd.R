library(nlrx)


### Name: simdesign
### Title: Construct a new simdesign object
### Aliases: simdesign

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load nl objects from test data.

# Simdesign examples for Wolf Sheep Predation model from NetLogo models library:

nl <- nl_simple
nl@simdesign <- simdesign_simple(nl = nl,
                                 nseeds = 3)

nl <- nl_distinct
nl@simdesign <- simdesign_distinct(nl = nl,
                                   nseeds = 3)

nl <- nl_ff
nl@simdesign <- simdesign_ff(nl = nl,
                             nseeds = 3)

nl <- nl_lhs
nl@simdesign <- simdesign_lhs(nl=nl,
                              samples=100,
                              nseeds=3,
                              precision=3)

nl <- nl_sobol
nl@simdesign <- simdesign_sobol(nl=nl,
                                samples=200,
                                sobolorder=2,
                                sobolnboot=20,
                                sobolconf=0.95,
                                nseeds=3,
                                precision=3)

nl <- nl_sobol2007
nl@simdesign <- simdesign_sobol2007(nl=nl,
                                    samples=200,
                                    sobolnboot=20,
                                    sobolconf=0.95,
                                    nseeds=3,
                                    precision=3)

nl <- nl_soboljansen
nl@simdesign <- simdesign_soboljansen(nl=nl,
                                      samples=200,
                                      sobolnboot=20,
                                      sobolconf=0.95,
                                      nseeds=3,
                                      precision=3)

nl <- nl_morris
nl@simdesign <- simdesign_morris(nl=nl,
                                 morristype="oat",
                                 morrislevels=4,
                                 morrisr=100,
                                 morrisgridjump=2,
                                 nseeds=3)

nl <- nl_eFast
nl@simdesign <- simdesign_eFast(nl=nl,
                                samples=100,
                                nseeds=3)

nl <- nl_lhs
nl@simdesign <- simdesign_GenAlg(nl=nl,
                                 popSize = 200,
                                 iters = 100,
                                 evalcrit = 1,
                                 elitism = NA,
                                 mutationChance = NA,
                                 nseeds = 1)

nl <- nl_lhs
nl@simdesign <- simdesign_GenSA(nl=nl,
                                par=NULL,
                                evalcrit=1,
                                control=list(max.time = 600),
                                nseeds=1)





