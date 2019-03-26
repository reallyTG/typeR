library(flowr)


### Name: to_flowmat
### Title: Create a flowmat using a list a commands.
### Aliases: as.flowmat is.flowmat to_flowmat to_flowmat.data.frame
###   to_flowmat.flow to_flowmat.list

### ** Examples


# Use this link for a few examples:
# http://docs.flowr.space/tutorial.html#define_modules

# create a flow mat, starting with a list of commands.
cmd_sleep = c("sleep 1", "sleep 2")
cmd_echo = c("echo 'hello'", "echo 'hello'")

# create a named list
lst = list("sleep" = cmd_sleep, "echo" = cmd_echo)
flowmat = to_flowmat(lst, samplename = "samp")



# read in a tsv; check and confirm format
ex = file.path(system.file(package = "flowr"), "pipelines")

flowmat = as.flowmat(file.path(ex, "sleep_pipe.tsv"))

# if your column names are different than defaults, explicitly specify them.
flowmat = as.flowmat(file.path(ex, "sleep_pipe.tsv"), jobname_col = "jobname")

# check if a object is a flowmat
is.flowmat(flowmat)



# create a flowdef, from this flowmat
flowdef = to_flowdef(flowmat)

# create a flow object using flowmat and flowdef
fobj = to_flow(flowmat, flowdef)

# extract a flowmat from a flow (here the samplename also contains the name of the flow)
flowmat2 = to_flowmat(fobj)



## submit the flow to the cluster (execute=TRUE) or do a dry-run (execute=FALSE)
## Not run: 
##D fobj2 = submit_flow(fobj, execute=FALSE)
##D fobj3 = submit_flow(fobj, execute=TRUE)
##D 
##D ## Get the status or kill all the jobs
##D status(fobj3)
##D kill(fobj3)
## End(Not run)






