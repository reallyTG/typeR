library(gtx)


### Name: hapmap.read.haplotypes
### Title: Read hapmap haplotypes.
### Aliases: hapmap.read.haplotypes

### ** Examples

## Not run: 
##D ## chromosomes 1-22
##D hapmap <- lapply(1:22, hapmap.read.haplotypes, path = "~/hapmap")
##D 
##D ## selected chromosomes only
##D hapmap <- lapply(1:22, function() return(NULL))
##D for (chr in c(1, 11, 17)) {
##D   hapmap[[chr]] <- hapmap.read.haplotypes(chr, path = "~/hapmap")
##D }
## End(Not run)



