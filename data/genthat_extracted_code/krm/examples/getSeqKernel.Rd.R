library(krm)


### Name: getSeqKernel
### Title: Protein Sequence Kernels
### Aliases: getSeqKernel

### ** Examples


fileName=paste(system.file(package="krm")[1],'/misc/SETpfamseed_aligned_for_testing.fasta',
     sep="")
K=getSeqKernel (fileName, kern.type="mi", tau=1, call.C=TRUE)
K





