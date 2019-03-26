library(nat.templatebrains)


### Name: nat.templatebrains-package
### Title: NeuroAnatomy Toolbox add-on package for handling template brains
### Aliases: nat.templatebrains-package nat.templatebrains
### Keywords: package registration template

### ** Examples

## Not run: 
##D # Plot all known registrations
##D plot(bridging_graph(), vertex.size=25)
##D 
##D ## manually add a new directory containing registrations to the search list
##D # Don't do this unless essential!
##D options(nat.templatebrains.regdirs=union(
##D   getOption('nat.templatebrains.regdirs'), "/my/new/path"))
##D # NB after mucking around with paths manually you must also manually update
##D # the cache so that new registrations are actually used.
##D nat.templatebrains:::reset_cache()
##D 
##D ## same, but override any built-in registration by putting the new path
##D # at the first position in the search list
##D options(nat.templatebrains.regdirs=union("/my/new/path"),
##D   getOption('nat.templatebrains.regdirs'))
## End(Not run)



