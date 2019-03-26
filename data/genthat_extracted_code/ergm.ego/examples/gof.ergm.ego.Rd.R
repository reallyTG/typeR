library(ergm.ego)


### Name: gof.ergm.ego
### Title: Conduct Goodness-of-Fit Diagnostics on a Exponential Family
###   Random Graph Model fit to Egocentrically Sampled Data
### Aliases: gof.ergm.ego
### Keywords: models

### ** Examples


data(faux.mesa.high)
fmh.ego <- as.egodata(faux.mesa.high)

head(fmh.ego)

egofit <- ergm.ego(fmh.ego~edges+degree(0:3)+nodefactor("Race")+nodematch("Race")
                         +nodefactor("Sex")+nodematch("Sex")+absdiff("Grade"), 
                          popsize=network.size(faux.mesa.high))

# Check whether the model "converged":
(modelgof <- gof(egofit, GOF="model"))
plot(modelgof)

# Check whether the model reconstructs the degree distribution:
(deggof <- gof(egofit, GOF="degree"))
plot(deggof)




