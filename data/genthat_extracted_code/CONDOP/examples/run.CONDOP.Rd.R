library(CONDOP)


### Name: run.CONDOP
### Title: Build condition-dependent operon maps.
### Aliases: run.CONDOP

### ** Examples

## Not run: 
##D     file_operon_annot <- system.file("extdata", "1944.opr", package="CONDOP")
##D     file_genome_seq   <- system.file("extdata", "EC-k12-MG1655.fasta", package="CONDOP")
##D     data(ct1)
##D     data.in   <- pre.proc(file_genome_annot, file_operon_annot, "NC_000913",
##D                           list.cov.dat = list(ct1 = ct1)) 
##D     res.comap <- run.CONDOP(data.in = data.in, bkgExprCDS = 0.2, bkgExprIGR = 0.2, 
##D                             maxLenIGR = 150, find.ext = TRUE)                      
## End(Not run)



