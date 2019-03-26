library(nat)


### Name: nlscan
### Title: Scan through a set of neurons, individually plotting each one in
###   3D
### Aliases: nlscan

### ** Examples

## Not run: 
##D # scan a neuronlist
##D nlscan(kcs20)
##D 
##D # using neuron names
##D nlscan(names(kcs20), db=kcs20)
##D # equivalently using a default neuron list
##D options(nat.default.neuronlist='kcs20')
##D nlscan(names(kcs20))
## End(Not run)
# scan without waiting
nlscan(kcs20[1:4], Wait=FALSE, sleep=0)
## Not run: 
##D # could select e.g. the gamma neurons with unbranched axons
##D gammas=nlscan(kcs20)
##D clear3d()
##D plot3d(kcs20[gammas])
##D 
##D # plot surface model of brain first
##D # nb depends on package only available on github
##D devtools::install_github(username = "jefferislab/nat.flybrains")
##D library(nat.flybrains)
##D plot3d(FCWB)
##D # could select e.g. the gamma neurons with unbranched axons
##D gammas=nlscan(kcs20)
##D clear3d()
##D plot3d(kcs20[gammas])
## End(Not run)



