library(flowr)


### Name: kill
### Title: Kill all jobs submitted to the computing platform, for one or
###   multiple flows
### Aliases: kill kill.character kill.flow

### ** Examples


## Not run: 
##D 
##D ## example for terminal
##D ## flowr kill_flow x=path_to_flow_directory
##D ## In case path matches multiple folders, flowr asks before killing
##D kill(x='fastq_haplotyper*')
##D  Flowr: streamlining workflows
##D  found multiple wds:
##D  /fastq_haplotyper-MS132-20150825-16-24-04-0Lv1PbpI
##D  /fastq_haplotyper-MS132-20150825-17-47-52-5vFIkrMD
##D  Really kill all of them ? kill again with force=TRUE
##D 
##D ## submitting again with force=TRUE will kill them:
##D kill(x='fastq_haplotyper*', force = TRUE)
## End(Not run)



