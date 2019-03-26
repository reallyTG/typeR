library(hpcwld)


### Name: ToSWF
### Title: Convertor from a dataset to Standart Workload Format
### Aliases: ToSWF
### Keywords: ~standard ~workload ~format

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
data(HPC_KRC)
ToSWF(HPC_KRC$interarrival, HPC_KRC$service, HPC_KRC$cores_requested, HPC_KRC$delay)



