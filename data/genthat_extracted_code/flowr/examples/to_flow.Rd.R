library(flowr)


### Name: to_flow
### Title: Create flow objects
### Aliases: flowr is.flow to_flow to_flow.character to_flow.data.frame
###   to_flow.flowmat to_flow.list

### ** Examples

## Use this link for a few elaborate examples:
## http://docs.flowr.space/flowr/tutorial.html#define_modules

ex = file.path(system.file(package = "flowr"), "pipelines")
flowmat = as.flowmat(file.path(ex, "sleep_pipe.tsv"))
flowdef = as.flowdef(file.path(ex, "sleep_pipe.def"))
fobj = to_flow(x = flowmat, def = flowdef, flowname = "sleep_pipe", platform = "lsf")


## create a vector of shell commands
cmds = c("sleep 1", "sleep 2")
## create a named list
lst = list("sleep" = cmds)
## create a flowmat
flowmat = to_flowmat(lst, samplename = "samp")

## Use flowmat to create a skeleton flowdef
flowdef = to_flowdef(flowmat)

## use both (flowmat and flowdef) to create a flow
fobj = to_flow(flowmat, flowdef)

## submit the flow to the cluster (execute=TRUE) or do a dry-run (execute=FALSE)
## Not run: 
##D fobj2 = submit_flow(fobj, execute=FALSE)
##D fobj3 = submit_flow(fobj, execute=TRUE)
##D 
##D ## Get the status or kill all the jobs
##D status(fobj3)
##D kill(fobj3)
## End(Not run)





