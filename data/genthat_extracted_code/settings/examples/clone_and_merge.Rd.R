library(settings)


### Name: clone_and_merge
### Title: Create a local, altered copy of an options manager
### Aliases: clone_and_merge

### ** Examples

# Create global option manager.
opt <- options_manager(foo=1,bar='a')

# create an altered copy
loc_opt <- clone_and_merge(opt, foo=2)

# this has no effect on the 'global' version
opt()
# but the local version is different
loc_opt()

# we alter the global version and reset the local version
opt(foo=3)
reset(loc_opt)
opt()
loc_opt()

# create an options manager with some option values limited
opt <- options_manager(prob=0.5,y='foo',z=1,
  .allowed=list(
     prob = inrange(min=0,max=1)
     , y    = inlist("foo","bar")
   )
 )
# change an option
opt(prob=0.8)
opt("prob")
## Not run: 
##D # this gives an error
##D opt(prob=2)
## End(Not run)



