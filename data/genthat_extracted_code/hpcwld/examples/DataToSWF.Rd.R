library(hpcwld)


### Name: DataToSWF
### Title: Convertor from a dataframe to Standart Workload Format
### Aliases: DataToSWF
### Keywords: ~standard ~workload ~format

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
data(HPC_KRC)
tmp=data.frame(T=HPC_KRC$interarrival, S=HPC_KRC$service, N=HPC_KRC$cores_used, D=HPC_KRC$delay)
DataToSWF(tmp)



