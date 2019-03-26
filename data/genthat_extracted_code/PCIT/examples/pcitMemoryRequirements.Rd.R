library(PCIT)


### Name: pcitMemoryRequirement
### Title: Calculate the memory requirement for running PCIT
### Aliases: pcitMemoryRequirement

### ** Examples

	m <- matrix(1, 20, 20)
	diag(m) <- 0
	m
	pcitMemoryRequirement(m, "KB")
	pcitMemoryRequirement(10000, "GB")



