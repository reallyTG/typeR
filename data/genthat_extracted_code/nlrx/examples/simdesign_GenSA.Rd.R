library(nlrx)


### Name: simdesign_GenSA
### Title: Add a Simulated Annealing simdesign to a nl object
### Aliases: simdesign_GenSA

### ** Examples


# To attach a simdesign, a nl object needs to be created first (see ?nl).
# For this example, we load a nl object from test data.

nl <- nl_lhs
nl@simdesign <- simdesign_GenSA(nl=nl,
                                 par=NULL,
                                 evalcrit=1,
                                 control=list(max.time = 600),
                                 nseeds=1)





