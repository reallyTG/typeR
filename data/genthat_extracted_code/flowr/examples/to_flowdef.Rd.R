library(flowr)


### Name: to_flowdef
### Title: Flow Definition defines how to stich steps into a (work)flow.
### Aliases: as.flowdef definition flowdef is.flowdef to_flowdef
###   to_flowdef.character to_flowdef.flow to_flowdef.flowmat

### ** Examples

# see ?to_flow for more examples

# read in a tsv; check and confirm format
ex = file.path(system.file(package = "flowr"), "pipelines")

# read in a flowdef from file
flowdef = as.flowdef(file.path(ex, "sleep_pipe.def"))

# check if this a flowdef
is.flowdef(flowdef)

# use a flowmat, to create a sample flowdef
flowmat = as.flowmat(file.path(ex, "sleep_pipe.tsv"))
to_flowdef(flowmat)

# change the platform
to_flowdef(flowmat, platform = "lsf")

# change the queue name
def = to_flowdef(flowmat, 
 platform = "lsf", 
 queue = "long")
plot_flow(def)

# guess submission and dependency types
def2 = to_flowdef(flowmat, 
 platform = "lsf", 
 queue = "long", 
 guess = TRUE)
plot_flow(def2)






