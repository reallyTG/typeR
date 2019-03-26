library(mmap)


### Name: mmapFlags
### Title: Create Bitwise Flags for mmap.
### Aliases: mmapFlags
### Keywords: utilities

### ** Examples

mmapFlags(PROT_READ)
mmapFlags(PROT_READ | PROT_WRITE)
mmapFlags("PROT_READ" | "PROT_WRITE")
mmapFlags(PROT_READ , PROT_WRITE)
mmapFlags("PROT_READ" , "PROT_WRITE")



