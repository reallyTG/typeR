library(ARTP)


### Name: runPermutations
### Title: Calculate observed and permutation p-values for SNPs
### Aliases: runPermutations
### Keywords: model

### ** Examples

  # Define snp.list
 geno_file <- system.file("sampleData", "geno_data.txt", package="ARTP")
 snp.list <- list(file=geno_file, file.type=2, delimiter="\t")

 # Define pheno.list
 pheno_file <- system.file("sampleData", "pheno_data.txt", package="ARTP")
 pheno.list <- list(file=pheno_file, delimiter="\t", id.var="ID",
                    response.var="Y", main.vars=c("X1", "X2"))

 # Options list. Change obs.outfile and perm.outfile if needed.
 op <- list(nperm=10, obs.outfile="./obs.txt", perm.outfile="./perm.txt",
            perm.method=2)

 # Not run
 # runPermutations(snp.list, pheno.list, 1, op=op)  




